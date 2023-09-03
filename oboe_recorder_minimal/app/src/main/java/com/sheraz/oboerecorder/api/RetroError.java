package com.sheraz.oboerecorder.api;

/**
 * Created by prabal on 26/07/2020.
 */

public class RetroError {
    private final int httpErrorCode;
    private String errorMessage;
    private final Kind kind;

    public RetroError(Kind kind, String errorMessage, int httpErrorCode) {
        this.httpErrorCode = httpErrorCode;
        this.kind = kind;
        this.errorMessage = errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public int getHttpErrorCode() {
        return this.httpErrorCode;
    }

    public String getErrorMessage() {
        return this.errorMessage;
    }

    public Kind getKind() {
        return this.kind;
    }

    public static enum Kind {
        NETWORK,
        HTTP,
        UNEXPECTED;
        private Kind() {
        }
    }
}
