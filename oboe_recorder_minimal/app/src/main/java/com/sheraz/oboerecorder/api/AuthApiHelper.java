package com.sheraz.oboerecorder.api;


import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Streaming;
import retrofit2.http.Url;

/**
 * Created by prabal on 26/07/2020.
 */

public interface AuthApiHelper {

    // option 2: using a dynamic URL
    @GET
    @Streaming
    Call<ResponseBody> downloadFileWithDynamicUrlSync(@Url String fileUrl);
}

