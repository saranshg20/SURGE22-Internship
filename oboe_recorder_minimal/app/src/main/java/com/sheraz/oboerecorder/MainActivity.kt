package com.sheraz.oboerecorder

import android.Manifest
import android.annotation.SuppressLint
import android.app.ProgressDialog
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.os.*
import androidx.appcompat.app.AppCompatActivity
import android.util.Log
import android.widget.Toast
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat
import androidx.localbroadcastmanager.content.LocalBroadcastManager
import com.sheraz.oboerecorder.api.AuthApiHelper
import kotlinx.android.synthetic.main.activity_main.*
import okhttp3.ResponseBody
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import java.io.*
import java.io.File
import android.os.StrictMode.ThreadPolicy
import android.view.View
import android.widget.EditText
import android.widget.RadioButton
import android.widget.RadioGroup
import android.widget.Toast.LENGTH_SHORT
import androidx.core.content.FileProvider
import java.net.URI


class MainActivity : AppCompatActivity() {

    var mRecordingOffsetMargin = 1
    var mGainFactor = 1.0
    var mSampleRateFactor = 1.0

    //Runtime Permissions for access of external storage, recorder, player etc.
    private val AUDIO_RECORD_REQUEST = 12446
    private val PERMISSIONS = arrayOf(
        Manifest.permission.RECORD_AUDIO,
        Manifest.permission.READ_EXTERNAL_STORAGE,
        Manifest.permission.WRITE_EXTERNAL_STORAGE
    )

    // In the variable filepath will be stored of the recorded file
    private var mFilePath = ""
    // Please wait dialog
    var progressDialog: ProgressDialog? = null

    // Android activity lifecycle first method which is called as the screen is opened

    override fun onCreate(savedInstanceState: Bundle?) {

        Log.d(TAG, "onCreate: ")

        super.onCreate(savedInstanceState)
        // This is setting the xml file which means the front end of this app on launch
        setContentView(R.layout.activity_main)
        //Permission Checking
        if (Build.VERSION.SDK_INT > 9) {
            //Disable the detection of everything
            val policy = ThreadPolicy.Builder().permitAll().build()
            StrictMode.setThreadPolicy(policy)
        }
// It will download the signal from server
        startDownload("http://139.59.6.145/api/machine-audio/chirp48.wav")
//Oboe code is now called
        AudioEngine.create()
        // Initialization of UI
        initUI()
        //Checking permission
        checkRecordAudioPermission()
    }

    //method is called when Screen visible to user in foreground and a broadcast is called which starts the recording
    override fun onResume() {

        Log.d(TAG, "onResume: ")
        super.onResume()

        this.let {
            LocalBroadcastManager.getInstance(it).registerReceiver(
                mMessageReceiver1,
                IntentFilter("prabal_recordings")
            )
        }

    }

    //when task is completed it destroys the objects and clean it
    override fun onDestroy() {

        Log.d(TAG, "onDestroy: ")
        super.onDestroy()
        AudioEngine.delete()

    }

    // Initialization of UI
    private fun initUI() {

        Log.d(TAG, "initUI: ")

        btnStartRecording.setOnClickListener {

            AudioEngine.setGainFactor(getGainFactor())
            AudioEngine.setSampleRateFactor(getSampleRateFactor())

            val intent = Intent(this, StuDelayCalculateService::class.java)
            this.startService(intent)
            if (!checkRecordAudioPermission()) {
                return@setOnClickListener
            }

            /*
            Can try to implement runnable method here
             */
            /**
             * @Deprecated
            Handler().postDelayed({
                AudioEngine.startPlayingFromFile(Constant.downloadfilepath)
            }, 100)
             **/
            Handler(Looper.getMainLooper()).postDelayed({
                AudioEngine.startPlayingFromFile(Constant.downloadfilepath)
            }, 150);
        }
// this button stops the recording
        btnStopRecording.setOnClickListener {

            if (!checkRecordAudioPermission()) {
                return@setOnClickListener
            }

            Log.d(TAG, "btnStopRecording.onClick: ")
            //recorder stopped
            AudioEngine.stopRecording()

            Log.v("StopRecording:Margin: ", mRecordingOffsetMargin.toString())
            mFilePath = Utils.getAudioRecordingFilePath(this)
            //file is written
            AudioEngine.writeFile(mFilePath, mRecordingOffsetMargin)
        }

        //Start play from file

        btnStartPlayFromFile.setOnClickListener {

            if (!checkRecordAudioPermission()) {
                return@setOnClickListener
            }

            if (mFilePath.isEmpty()) return@setOnClickListener

            Log.d(TAG, "btnStartPlayFromFile.onClick: ")
            val toast = Toast.makeText(applicationContext, mFilePath, Toast.LENGTH_LONG)
            toast.show()
            Log.d(TAG, "File stored at $mFilePath")
            AudioEngine.startPlayingFromFile(mFilePath)
        }
//Stop play from file
        btnStopPlayFromFile.setOnClickListener {

            if (!checkRecordAudioPermission()) {
                return@setOnClickListener
            }

            if (mFilePath.isEmpty()) return@setOnClickListener

            Log.d(TAG, "btnStopPlayFromFile.onClick: ")
            AudioEngine.stopPlayingFromFile()
        }

//Share file through email, whatsapp, etc.
        btnShareFile.setOnClickListener{
            val file = File(mFilePath)
            if(mFilePath.isEmpty()){
                Toast.makeText(this,"No Recordings available..", LENGTH_SHORT)
                return@setOnClickListener
            }

            //else execute this
            val sharingIntent = Intent(android.content.Intent.ACTION_SEND)
            sharingIntent.type = "audio/wav"
            val subjectText = file.name
            sharingIntent.putExtra(Intent.EXTRA_SUBJECT, subjectText)
            Log.v(TAG, "Entered Intent: ")
            val uri = FileProvider.getUriForFile(applicationContext, BuildConfig.APPLICATION_ID+".provider", file)
            sharingIntent.putExtra(Intent.EXTRA_STREAM, uri)
            sharingIntent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            startActivity(Intent.createChooser(sharingIntent, "Share WAV using: "))

        }


    }

    //method of checking permissions
    private fun checkRecordAudioPermission(): Boolean {

        Log.d(TAG, "checkRecordAudioPermission: ")

        val isRecordingAllowed = isRecordPermissionGranted()
        Log.i(TAG, "checkRecordAudioPermission: $isRecordingAllowed")

        if (!isRecordingAllowed) {

            requestRecordPermission()
            disableControls()

        } else {

            enableControls()

        }

        return isRecordingAllowed
    }

    private fun isRecordPermissionGranted(): Boolean {

        val permissionStatus = (ActivityCompat
            .checkSelfPermission(
                this,
                Manifest.permission.RECORD_AUDIO
            ) == PackageManager.PERMISSION_GRANTED) &&
                (ActivityCompat
                    .checkSelfPermission(
                        this,
                        Manifest.permission.READ_EXTERNAL_STORAGE
                    ) == PackageManager.PERMISSION_GRANTED) &&
                (ActivityCompat
                    .checkSelfPermission(
                        this,
                        Manifest.permission.WRITE_EXTERNAL_STORAGE
                    ) == PackageManager.PERMISSION_GRANTED)

        Log.d(TAG, "isRecordPermissionGranted: $permissionStatus")

        return permissionStatus
    }

    private fun requestRecordPermission() {

        Log.d(TAG, "requestRecordPermission: ")
        ActivityCompat.requestPermissions(this, PERMISSIONS, AUDIO_RECORD_REQUEST)

    }

    override fun onRequestPermissionsResult(
        requestCode: Int, permissions: Array<String>,
        grantResults: IntArray
    ) {

        Log.d(TAG, "onRequestPermissionsResult: requestCode = $requestCode, ")
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)

        if (AUDIO_RECORD_REQUEST != requestCode) {
            return
        }

        // handle the case when user clicks on "Don't ask again"
        // inside permission dialog
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {

            if (!shouldShowRequestPermissionRationale(PERMISSIONS[0]) ||
                !shouldShowRequestPermissionRationale(PERMISSIONS[1]) ||
                !shouldShowRequestPermissionRationale(PERMISSIONS[2])
            ) {

                Log.w(
                    TAG,
                    "onRequestPermissionsResult: Some Permission(s) not granted, show error dialog."
                )
                Utils.showPermissionsErrorDialog(this)
                return

            }

        }

        if (!isRecordPermissionGranted()) {

            Log.w(
                TAG,
                "onRequestPermissionsResult: Some Permission(s) not granted, disable controls"
            )
            disableControls()

        } else {

            Log.i(
                TAG,
                "onRequestPermissionsResult: ALL Permissions granted, continue with enableControls"
            )
            enableControls()

        }
    }

    private fun enableControls() {

        Log.d(TAG, "enableControls: ")

        tvStatus.text = ""
        //btnStartPlayingFromRecording.isEnabled = true
        btnStartRecording.isEnabled = true
        // btnStopPlayingFromRecording.isEnabled = true
        btnStopRecording.isEnabled = true
        //btnWriteToFile.isEnabled = true
        btnStartPlayFromFile.isEnabled = true
        btnStopPlayFromFile.isEnabled = true


    }

    private fun disableControls() {

        Log.d(TAG, "disableControls: ")

        tvStatus.text = getString(R.string.need_record_audio_permission)
        //btnStartPlayingFromRecording.isEnabled = false
        btnStartRecording.isEnabled = false
        //btnStopPlayingFromRecording.isEnabled = false
        btnStopRecording.isEnabled = false
        // btnWriteToFile.isEnabled = false
        btnStartPlayFromFile.isEnabled = false
        btnStopPlayFromFile.isEnabled = false


    }


    companion object {
        private val TAG = MainActivity::class.java.simpleName
    }

    private val mMessageReceiver: BroadcastReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent) {
            // Get extra data included in the Intent
            //RecorderState.STOP -> stopRecording();
            /* waveRecorder.stopRecording()
             stopRecording()*/
            Log.d(TAG, "btnStopRecording.onClick: ")
            AudioEngine.stopRecording()

            Log.d("receiver", "Got message")
        }
    }

    private val mMessageReceiver1: BroadcastReceiver = object : BroadcastReceiver() {
        @SuppressLint("NewApi")
        @RequiresApi(Build.VERSION_CODES.N)
        override fun onReceive(context: Context?, intent: Intent) {

            Log.d(TAG, "btnStartRecording.onClick: ")
            AudioEngine.startRecording()
        }
    }

    //
    //}
    //download method
    private fun startDownload(url: String) {
        // Utils.log(url)
        val fileName = url.substring(url.lastIndexOf('/') + 1, url.length)
        //Utils.log(fileName)
        /*File file = new File(context.getFilesDir(), fileName);
        if (!file.exists()) {*/
        // Show Progress Dialog
        progressDialog = ProgressDialog(this)
        progressDialog!!.setMessage("Please Wait...")
        progressDialog!!.setCancelable(false)
        progressDialog!!.show()
        val builder: Retrofit.Builder = Retrofit.Builder().baseUrl(Constant.myurl)
        val retrofit = builder.build()
        val authApiHelper: AuthApiHelper = retrofit.create(AuthApiHelper::class.java)
        val call: Call<ResponseBody> = authApiHelper.downloadFileWithDynamicUrlSync(url)
        call.enqueue(object : Callback<ResponseBody?> {
            override fun onResponse(call: Call<ResponseBody?>, response: Response<ResponseBody?>) {
                if (response.isSuccessful) {
                    val results = writeResponseBodyToDisk(response.body(), fileName)
                    /**In the lines below, we create a directory named VoiceRecorderSimplifiedCoding/Audios in the phone storage
                     * and the audios are being stored in the Audios folder  */
                    val root = Environment.getExternalStorageDirectory()
                    val file = File(root.absolutePath + "/Narottam/Audios")
                    if (!file.exists()) {
                        file.mkdirs()
                    }
//                    fileName =  root.getAbsolutePath() + "/Narottam/Audios/" + String.valueOf(System.currentTimeMillis() + ".mp3");
                    // end here
                } else {
                    // Utils.log("Download Success :" + false)
                }
                // Close Progress Dialog
                progressDialog!!.dismiss()
            }

            override fun onFailure(call: Call<ResponseBody?>, t: Throwable) {

                // Close Progress Dialog
                progressDialog!!.dismiss()
                Toast.makeText(
                    this@MainActivity,
                    "Downloading failed,Please try again.",
                    Toast.LENGTH_LONG
                ).show()
            }
        })
        // }
    }


    //

    //
    private fun writeResponseBodyToDisk(body: ResponseBody?, fileName: String): Boolean {
        return try {
            // todo change the file location/name according to your needs
            //File futureStudioIconFile = new File(getActivity().getFilesDir(), fileName);
            val futureStudioIconFile: File = File(this.filesDir, fileName)
            if (!futureStudioIconFile.exists()) {
                futureStudioIconFile.createNewFile()
            }
            ////////////////////////////////////////////////////////////////////////////////////////////
            //String filepaht = String.valueOf(futureStudioIconFile);
            /* downloadfilepaht =
                  futureStudioIconFile.toString()*/
            Constant.Companion.downloadfilepath=futureStudioIconFile.toString()

            var inputStream: InputStream? = null
            var outputStream: OutputStream? = null
            try {
                val fileReader = ByteArray(4096)
                val fileSize = body!!.contentLength()
                var fileSizeDownloaded: Long = 0
                inputStream = body.byteStream()
                outputStream = FileOutputStream(futureStudioIconFile)
                while (true) {
                    val read = inputStream.read(fileReader)
                    if (read == -1) {
                        break
                    }
                    outputStream.write(fileReader, 0, read)
                    fileSizeDownloaded += read.toLong()
                }
                outputStream.flush()
                true
            } catch (e: IOException) {
                false
            } finally {
                inputStream?.close()
                outputStream?.close()
            }
        } catch (e: IOException) {
            false
        }
    }

    fun onOffsetMarginBoxClicked(v:View){
        val mOffsetMargin = findViewById<RadioGroup>(R.id.radio_group_1)
        if (mOffsetMargin.checkedRadioButtonId==R.id.margin_box_1) {
            mRecordingOffsetMargin = 1
        }
        else if (mOffsetMargin.checkedRadioButtonId==R.id.margin_box_2) {
            mRecordingOffsetMargin = 2
        }
        AudioEngine.setOffsetValue(mRecordingOffsetMargin)
        Log.v("RecordingOffsetMargin: ", mRecordingOffsetMargin.toString())
    }

    private fun getGainFactor(): Double{
        val mGainEditTextView = findViewById<EditText>(R.id.gain_edit_box)
        val mEditable = mGainEditTextView.text

        if(mEditable.toString()==""){
            mGainFactor = 1.0
        }
        else {
            mGainFactor = (mEditable.toString()).toDouble()
        }
        if(mGainFactor>2){
            mEditable.replace(0, mEditable.length, "2", 0, 1)
            mGainFactor = 2.0
        }
        else if(mGainFactor<0.5){
            mEditable.replace(0, mEditable.length, "0.5", 0, 3)
            mGainFactor = 0.5
        }
        return mGainFactor
    }

    private fun getSampleRateFactor(): Double{
        val mSampleRateEditTextView = findViewById<EditText>(R.id.sample_rate_factor_edit_box)
        val mEditable = mSampleRateEditTextView.text

        if(mEditable.toString()==""){
            mSampleRateFactor = 1.0
        }
        else {
            mSampleRateFactor = (mEditable.toString()).toDouble()
        }
        if(mSampleRateFactor>3){
            mEditable.replace(0, mEditable.length, "3", 0, 1)
            mGainFactor = 3.0
        }
        else if(mSampleRateFactor<0.25){
            mEditable.replace(0, mEditable.length, "0.25", 0, 4)
            mSampleRateFactor = 0.25
        }
        return mSampleRateFactor
    }
}
