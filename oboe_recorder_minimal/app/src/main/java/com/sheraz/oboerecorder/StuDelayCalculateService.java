package com.sheraz.oboerecorder;

import android.app.Service;
import android.content.Intent;
import android.os.Build;
import android.os.IBinder;
import android.util.Log;

import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;

import com.google.android.exoplayer2.LoadControl;
import com.google.android.exoplayer2.SimpleExoPlayer;
import com.google.android.exoplayer2.trackselection.AdaptiveTrackSelection;
import com.google.android.exoplayer2.trackselection.TrackSelector;
import com.google.android.exoplayer2.upstream.DefaultBandwidthMeter;

public class StuDelayCalculateService extends Service {
    SimpleExoPlayer player;
    private AdaptiveTrackSelection.Factory mAdaptiveTrackSelectionFactory;
    private TrackSelector mTrackSelector;
    private LoadControl mLoadControl;
    private DefaultBandwidthMeter mBandwidthMeter;

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    @Override
    public void onCreate() {
        super.onCreate();
    }

    public int onStartCommand(Intent intent, int flags, int startId) {

//        No advantage of making the thread sleep
//        sendBroadcastForRecording();
//        try {
//            Thread.sleep(10);
//        }
//        catch (InterruptedException e)
//        {
//            e.printStackTrace();
//        }

        sendBroadcastForRecording();
//        AudioEngine.startPlayingFromFile(Constant.Companion.getDownloadfilepath());


//        final Handler handler = new Handler(Looper.getMainLooper());
//        handler.postDelayed(new Runnable() {
//            @Override
//            public void run() {
////                  Do something after 100ms
////                  sendBroadcastForRecording();
////        uncomment below part
////        AudioEngine.startPlayingFromFile(Constant.Companion.getDownloadfilepath());
//            }
//        }, 50);

        return startId;
    }


    public void onStart(Intent intent, int startId) {
    }

    @Override
    public void onDestroy() {

    }

    @Override
    public void onLowMemory() {
    }

    private void sendBroadcastForRecording() {
        Log.d("sender", "Broadcasting message");
        Intent intent = new Intent("prabal_recordings");
        // You can also include some extra data.
        LocalBroadcastManager.getInstance(this).sendBroadcast(intent);
    }

}
