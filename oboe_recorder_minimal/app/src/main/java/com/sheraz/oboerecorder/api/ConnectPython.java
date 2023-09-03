package com.sheraz.oboerecorder.api;

import android.content.Context;

import com.sheraz.oboerecorder.Utilss;

import java.util.concurrent.TimeUnit;

import okhttp3.OkHttpClient;
import okhttp3.logging.HttpLoggingInterceptor;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class ConnectPython {

    //public static final String BASE_URL = "https://naro.goweblisting.com/api/";

    //public static final String BASE_URL = "https://naro.mcainternship.com/api/";
    // public static final String BASE_URL = "https://betanaro.mcainternship.com/api/";
   // public static final String BASE_URL="http://139.59.6.145/api/";
    public static final String BASE_URL1="http://139.59.6.145:5000/";

    private static Retrofit retrofit = null;

    // suraj api
    public static Retrofit getClientt(final Context context) {

        if (retrofit == null) {
            OkHttpClient.Builder httpClient;
            if (Utilss.isDebug()) {
                HttpLoggingInterceptor logging = new HttpLoggingInterceptor();
                logging.setLevel(HttpLoggingInterceptor.Level.BODY);
                httpClient = new OkHttpClient.Builder();
                httpClient.addInterceptor(logging);
                httpClient.connectTimeout(1000, TimeUnit.SECONDS);
                httpClient.readTimeout(1000, TimeUnit.SECONDS);

            } else {
                httpClient = new OkHttpClient.Builder();
            }
            retrofit = new Retrofit.Builder()
                    .baseUrl(BASE_URL1)
                    .addConverterFactory(GsonConverterFactory.create())
                    .client(httpClient.build())
                    .build();
        }
        return retrofit;
    }

}
