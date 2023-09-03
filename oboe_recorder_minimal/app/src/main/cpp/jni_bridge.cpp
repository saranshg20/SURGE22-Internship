
#ifndef MODULE_NAME
#define MODULE_NAME  "jni_bridge"
#endif

#include <jni.h>
#include "AudioEngine.h"
#include "logging_macros.h"

const char *TAG = "jni_bridge:: %s";
static AudioEngine *audioEngine = nullptr;

extern "C" {

JNIEXPORT jboolean JNICALL
Java_com_sheraz_oboerecorder_AudioEngine_create(JNIEnv *env, jclass) {

    LOGD(TAG, "create(): ");

    if (audioEngine == nullptr) {
        audioEngine = new AudioEngine();
    }

    return (audioEngine != nullptr);
}

JNIEXPORT void JNICALL
Java_com_sheraz_oboerecorder_AudioEngine_delete(JNIEnv *env, jclass) {

    LOGD(TAG, "delete(): ");

    delete audioEngine;
    audioEngine = nullptr;

}

JNIEXPORT void JNICALL
Java_com_sheraz_oboerecorder_AudioEngine_startRecording(JNIEnv *env, jclass) {

    LOGD(TAG, "startRecording(): ");

    if (audioEngine == nullptr) {
        LOGE(TAG, "audioEngine is null, you must call create() method before calling this method");
        return;
    }

    audioEngine->startRecording();

}

JNIEXPORT void JNICALL
Java_com_sheraz_oboerecorder_AudioEngine_stopRecording(JNIEnv *env, jclass) {

    LOGD(TAG, "stopRecording(): ");

    if (audioEngine == nullptr) {
        LOGE(TAG, "audioEngine is null, you must call create() method before calling this method");
        return;
    }

    audioEngine->stopRecording();

}

JNIEXPORT void JNICALL
Java_com_sheraz_oboerecorder_AudioEngine_startPlayingRecordedStream(JNIEnv *env, jclass) {

    LOGD(TAG, "startPlayingRecordedStream(): ");

    if (audioEngine == nullptr) {
        LOGE(TAG, "audioEngine is null, you must call create() method before calling this method");
        return;
    }

    audioEngine->startPlayingRecordedStream();

}

JNIEXPORT void JNICALL
Java_com_sheraz_oboerecorder_AudioEngine_stopPlayingRecordedStream(JNIEnv *env, jclass) {

    LOGD(TAG, "stopPlayingRecordedStream(): ");

    if (audioEngine == nullptr) {
        LOGE(TAG, "audioEngine is null, you must call create() method before calling this method");
        return;
    }

    audioEngine->stopPlayingRecordedStream();

}

JNIEXPORT void JNICALL
Java_com_sheraz_oboerecorder_AudioEngine_writeFile(JNIEnv *env, jclass, jstring filePath, jint offset) {

    LOGD(TAG, "writeFile(): filePath = ");
//    LOGD(TAG, filePath);

    if (audioEngine == nullptr) {
        LOGE(TAG, "audioEngine is null, you must call create() method before calling this method");
        return;
    }

    const char *path;

    path = env->GetStringUTFChars(filePath, nullptr);
    audioEngine->writeToFile(path, offset);
    env->ReleaseStringUTFChars(filePath, path);
}

JNIEXPORT void JNICALL
Java_com_sheraz_oboerecorder_AudioEngine_startPlayingFromFile(JNIEnv *env, jclass, jstring filePath) {

    LOGD(TAG, "startPlayingFromFile(): filePath = ");
//    LOGD(TAG, filePath);

    if (audioEngine == nullptr) {
        LOGE(TAG, "audioEngine is null, you must call create() method before calling this method");
        return;
    }

    const char *path;

    path = env->GetStringUTFChars(filePath, nullptr);
    audioEngine->startPlayingFromFile(path);
    env->ReleaseStringUTFChars(filePath, path);
}

JNIEXPORT void JNICALL
Java_com_sheraz_oboerecorder_AudioEngine_stopPlayingFromFile(JNIEnv *env, jclass) {

    LOGD(TAG, "stopPlayingFromFile(): ");

    if (audioEngine == nullptr) {
        LOGE(TAG, "audioEngine is null, you must call create() method before calling this method");
        return;
    }

    audioEngine->stopPlayingFromFile();
}
};


extern "C"
JNIEXPORT void JNICALL
Java_com_sheraz_oboerecorder_AudioEngine_setOffsetValue(JNIEnv *env, jclass clazz,
                                                        jint m_recording_offset_margin) {
    // TODO: implement setOffsetValue()
    audioEngine->setOffsetValue(m_recording_offset_margin);
}
extern "C"
JNIEXPORT void JNICALL
Java_com_sheraz_oboerecorder_AudioEngine_setGainFactor(JNIEnv *env, jclass clazz, jdouble gainFactor) {
    // TODO: implement setGainFactor()
    audioEngine->setGainFactor(gainFactor);
}
extern "C"
JNIEXPORT void JNICALL
Java_com_sheraz_oboerecorder_AudioEngine_setSampleRateFactor(JNIEnv *env, jclass clazz,
                                                             jdouble sample_rate_factor) {
    // TODO: implement setSampleRateFactor()
    audioEngine->setSampleRateFactor(sample_rate_factor);
}