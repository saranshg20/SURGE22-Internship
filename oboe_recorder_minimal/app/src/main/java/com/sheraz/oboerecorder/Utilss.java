package com.sheraz.oboerecorder;

/**
 * Created by prabal on 26/07/2020.
 */

import static android.Manifest.permission.ACCESS_FINE_LOCATION;
import static android.Manifest.permission.CAMERA;
import static android.Manifest.permission.WRITE_EXTERNAL_STORAGE;

import android.Manifest;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Typeface;
import android.net.Uri;
import android.provider.Settings;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Toast;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import java.net.MalformedURLException;
import java.net.URL;

public class Utilss {
    public static final int RequestPermissionCode = 1000;
    private static boolean peramCheck = true;
    public static Context appContext;
    static Typeface myTypeface_robotomedium;
    static Typeface myTypeface_robotobold;
    static Typeface myTypeface_robotoregular;
    static Typeface myTypeface_robotolight;


    public Utilss(Context applicationContext) {
        this.appContext = applicationContext;
    }


    public static void HideKeyPad(AppCompatActivity mActivity) {


        View view = mActivity.getCurrentFocus();
        if (view != null) {
            InputMethodManager imm = (InputMethodManager) mActivity.getSystemService(Context
                    .INPUT_METHOD_SERVICE);
            imm.hideSoftInputFromWindow(view.getWindowToken(), 0);
        }
    }

    public static void showLog(String TAG, String message) {
    }

    public static void showTost(Context context, String msg) {
        Toast.makeText(context, msg, Toast.LENGTH_LONG).show();
    }

    public static boolean isDebug() {
        return BuildConfig.DEBUG;
    }

    public static void setApplicaionContext(Context mContext) {
        appContext = mContext;
    }

    public static Context getApplicationContext() {
        return appContext;
    }



    // add
    @SuppressLint("NewApi")
    public static void RequestMultiplePermission(AppCompatActivity context) {
        // Creating String Array with Permissions.
        if (peramCheck) {
         /*   getApplicationContext().requestPermissions(context, new String[]{
                    WRITE_EXTERNAL_STORAGE, CAMERA
            }, RequestPermissionCode);*/
            context.requestPermissions(new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE, Manifest.permission.CAMERA, ACCESS_FINE_LOCATION}, RequestPermissionCode);
        }

    }

    public static void displayNeverAskAgainDialog(final AppCompatActivity mainActivity) {
        int FourthPermissionResult = ContextCompat.checkSelfPermission(mainActivity, WRITE_EXTERNAL_STORAGE);
        int FourthPermissionResult1 = ContextCompat.checkSelfPermission(mainActivity, CAMERA);
        int location_permission = ContextCompat.checkSelfPermission(mainActivity, ACCESS_FINE_LOCATION);
        if (FourthPermissionResult == PackageManager.PERMISSION_GRANTED && FourthPermissionResult1 == PackageManager.PERMISSION_GRANTED && location_permission == PackageManager.PERMISSION_GRANTED) {
        } else {
            AlertDialog.Builder builder = new AlertDialog.Builder(mainActivity);
            builder.setMessage(" Storage Permissions for performing necessary task. Please permit the permission through "
                    + "Settings screen.\n\nSelect Permissions -> Enable permission");
            builder.setCancelable(false);
            peramCheck = false;
            builder.setPositiveButton("Permit Manually", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    dialog.dismiss();
                    Intent intent = new Intent();
                    intent.setAction(Settings.ACTION_APPLICATION_DETAILS_SETTINGS);
                    Uri uri = Uri.fromParts("package", mainActivity.getApplicationContext().getPackageName(), null);
                    intent.setData(uri);
                    mainActivity.startActivity(intent);
                }
            });
            builder.setNegativeButton("Cancel", null);
            builder.show();
        }

    }


    public static void log(String msg) {
        Log.d( "DEBUG_LOGS",msg);
    }

    public static String getFileName(String extUrl) throws MalformedURLException {
        String filename = "";
        String path = new URL(extUrl).getPath();
        String[] pathContents = path.split("[\\\\/]");
        if (pathContents != null) {
            int pathContentsLength = pathContents.length;
            String lastPart = pathContents[pathContentsLength - 1];
            String[] lastPartContents = lastPart.split("\\.");
            if (lastPartContents != null && lastPartContents.length > 1) {
                int lastPartContentLength = lastPartContents.length;
                StringBuilder name = new StringBuilder();
                for (int i = 0; i < lastPartContentLength; i++) {
                    if (i < (lastPartContents.length - 1)) {
                        name.append(lastPartContents[i]);
                        if (i < (lastPartContentLength - 2)) {
                            name.append(".");
                        }
                    }
                }
                String extension = lastPartContents[lastPartContentLength - 1];
                filename = name + "." + extension;
            }
        }
        return filename;
    }
    //
}