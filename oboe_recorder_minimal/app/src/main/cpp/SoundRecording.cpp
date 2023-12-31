#include "SoundRecording.h"

int32_t SoundRecording::write(const int16_t *sourceData, int32_t numSamples, int offset) {

    LOGD(TAG, "write(): ");

    // Check that data will fit, if it doesn't then create new array,
    // copy over old data to new array then delete old array and
    // point mData to new array.
    if (mWriteIndex + numSamples > (kMaxSamples * mIteration)) {

        LOGW(TAG, "write(): mWriteIndex + numSamples > kMaxSamples");
        mIteration++;

        int32_t newSize = kMaxSamples * mIteration;

        auto * newData = new int16_t[newSize] { 0 };
        std::copy(mData, mData + mTotalSamples, newData);

        delete[] mData;
        mData = newData;
    }

    for (int i = 0; i < numSamples; i+=offsetVal) {
        mData[mWriteIndex++] = sourceData[i] * gain_factor;
    }

    mTotalSamples += numSamples;

    return numSamples;
}

int32_t SoundRecording::read(int16_t *targetData, int32_t numSamples) {

    LOGD(TAG, "read(): ");

    int32_t framesRead = 0;
    while (framesRead < numSamples && mReadIndex < mTotalSamples) {
        targetData[framesRead++] = mData[mReadIndex++];
        if (mIsLooping && mReadIndex == mTotalSamples) mReadIndex = 0;
    }

    return framesRead;  
}

SndfileHandle SoundRecording::createFile(const char *outfilename, int32_t outputChannels, int32_t sampleRate) {

    LOGD(TAG, "createFile(): ");

    SndfileHandle file;
    int format = SF_FORMAT_WAV | SF_FORMAT_PCM_16;

    LOGD(TAG, "createFile(): Creating file ");

    file = SndfileHandle (outfilename, SFM_WRITE, format, outputChannels, sampleRate);

    return file;
}

void SoundRecording::writeFile(SndfileHandle sndfileHandle) {

    int32_t framesRead = 0, bufferLength = mTotalSamples;
    if(bufferLength>192){
        bufferLength = 192;
    }
    sf_count_t framesWrite = 0;
    auto *buffer = new int16_t[bufferLength];

    fillArrayWithZeros(buffer, bufferLength);

    if(countOfIteration==0){
        countOfBuffers = 0;
        while ((framesRead = read(buffer, bufferLength)) > 0) {
            countOfBuffers++;
            if (countOfBuffers < 22)continue;
            sndfileHandle.write(buffer, framesRead);
        }
    }
    else if(countOfIteration<5){
        countOfBuffers = 0;
        while ((framesRead = read(buffer, bufferLength)) > 0) {
            countOfBuffers++;
            if (countOfBuffers < 18)continue;
            sndfileHandle.write(buffer, framesRead);
        }
    }
    else{
        countOfBuffers = 0;
        while ((framesRead = read(buffer, bufferLength)) > 0) {
            countOfBuffers++;
            if (countOfBuffers < 24)continue;
            sndfileHandle.write(buffer, framesRead);
        }
    }
//    while ((framesRead = read(buffer, bufferLength)) > 0) {
////            countOfBuffers++;
////            if (countOfBuffers < 16)continue;
//            sndfileHandle.write(buffer, framesRead);
//        }
    countOfIteration++;
    LOGD(TAG, "writeFile(): ");
    LOGD(TAG, to_string_with_precision(framesRead).c_str());
    LOGD(TAG, to_string_with_precision(countOfBuffers).c_str());
    LOGD(TAG, "writeFile(): countOfIteration ");
    LOGD(TAG, to_string_with_precision(countOfIteration).c_str());

}

void SoundRecording::readFileInfo(const char * fileName) {

    LOGD(TAG, "readFileInfo(): ");

    SndfileHandle file;
    file = SndfileHandle(fileName) ;

    LOGD (TAG, "readFileInfo(): Opened file => ") ;
    LOGD(TAG, fileName);

    LOGI (TAG, "readFileInfo(): Sample rate : ", file.samplerate());
    LOGI(TAG, std::to_string(file.samplerate()).c_str());
    LOGI (TAG, "readFileInfo(): Channels : ", file.channels()) ;
    LOGI(TAG, std::to_string(file.channels()).c_str());
    LOGI (TAG, "readFileInfo(): Frames : ", file.frames()) ;
    LOGI(TAG, std::to_string(file.frames()).c_str());

}

void SoundRecording::initiateWritingToFile(const char *outfilename, int32_t outputChannels, int32_t sampleRate) {

    LOGD(TAG, "initiateWritingToFile(): ");
    mSampleRate = sampleRate;
    SndfileHandle handle = createFile(outfilename, outputChannels, sampleRate*sampleRateFactor);
    writeFile(handle);
    readFileInfo(outfilename);

}

void SoundRecording::setOffsetValue(int i) {
    offsetVal = i;
}

void SoundRecording::setGainFactor(double d) {
    gain_factor = d;
}

void SoundRecording::setSampleRateFactor(double d) {
    sampleRateFactor = d;
}

//aaudio_result_t SoundRecording::calculateCurrentOutputLatencyMillis(AAudioStream *stream, double *latencyMillis) {
//
//    // Get the time that a known audio frame was presented for playing
//    int64_t existingFrameIndex;
//    int64_t existingFramePresentationTime;
//    aaudio_result_t result = AAudioStream_getTimestamp(stream,
//                                                       CLOCK_MONOTONIC,
//                                                       &existingFrameIndex,
//                                                       &existingFramePresentationTime);
//
//    if (result == AAUDIO_OK){
//
//        // Get the write index for the next audio frame
//        int64_t writeIndex = AAudioStream_getFramesWritten(stream);
//
//        // Calculate the number of frames between our known frame and the write index
//        int64_t frameIndexDelta = writeIndex - existingFrameIndex;
//
//        // Calculate the time which the next frame will be presented
//
//        const int64_t NANOS_PER_SECOND = 1e9;
//        int64_t frameTimeDelta = (frameIndexDelta * NANOS_PER_SECOND) / mSampleRate;
//        int64_t nextFramePresentationTime = existingFramePresentationTime + frameTimeDelta;
//
//        // Assume that the next frame will be written at the current time
//        int64_t nextFrameWriteTime = get_time_nanoseconds(CLOCK_MONOTONIC);
//
//        // Calculate the latency
//        const double NANOS_PER_MILLISECOND = 1e6;
//        *latencyMillis = (double) (nextFramePresentationTime - nextFrameWriteTime)
//                         / NANOS_PER_MILLISECOND;
//    } else {
//        LOGE("Error calculating latency: %s", AAudio_convertResultToText(result));
//    }
//
//    return result;
//}
//
//int64_t SoundRecording::get_time_nanoseconds(int i) {
//    return i*1e9;
//}

//void SoundRecording::writeToFile(const char *outfilename, int32_t outputChannels, int32_t sampleRate) {
//
//    LOGD(TAG, "writeToFile(): ");
//
//    SNDFILE *outfile, *recordedFile;
//    SF_INFO sfinfo;
//    sf_count_t framesWrite = 0;
////    int32_t framesRead = 0, bufferLength = outputChannels * sampleRate;
//    int32_t framesRead = 0, bufferLength = mTotalSamples;
//    auto* buffer = new int[bufferLength]{0};
//
//    memset(&sfinfo, 0, sizeof(sfinfo));
//
//    sfinfo.frames = mTotalSamples;
//    sfinfo.channels = outputChannels;
//    sfinfo.samplerate = sampleRate;
//    sfinfo.format = SF_FORMAT_WAV | SF_FORMAT_PCM_16;
//
//
//    LOGV(TAG, "writeToFile(): ==== BEFORE WRITING INPUT INFO ==== ");
//
//    LOGV(TAG, "writeToFile(): sfinfo.frames = ");
//    LOGV(TAG, std::to_string(sfinfo.frames).c_str());
//
//    LOGV(TAG, "writeToFile(): sfinfo.channels = ");
//    LOGV(TAG, std::to_string(sfinfo.channels).c_str());
//
//    LOGV(TAG, "writeToFile(): sfinfo.format = ");
//    LOGV(TAG, std::to_string(sfinfo.format).c_str());
//
//    LOGV(TAG, "writeToFile(): sfinfo.samplerate = ");
//    LOGV(TAG, std::to_string(sfinfo.samplerate).c_str());
//
//    LOGV(TAG, "writeToFile(): ==== BEFORE WRITING INPUT INFO ==== ");
//
//
//    if (!(outfile = sf_open(outfilename, SFM_WRITE, &sfinfo))) {
//        LOGD(TAG, "Error : could not open file : %s\n", outfilename);
//        LOGD(TAG, sf_strerror(outfile));
//        exit(1);
//    };
//
//    if (!sf_format_check(&sfinfo)) {
//        sf_close(outfile);
//        LOGD(TAG, "writeToFile(): Invalid encoding");
//        return;
//    };
//
//    while ((framesRead = read(buffer, bufferLength)) > 0) {
//
//        LOGD(TAG, "writeToFile(): framesRead = ");
//        LOGD(TAG, std::to_string(framesRead).c_str());
//
//        framesWrite = sf_write_int(outfile, buffer, framesRead);
//
//        LOGD(TAG, "writeToFile(): framesWrite = ");
//        LOGD(TAG, std::to_string(framesWrite).c_str());
//
//    }
//
//    sf_close(outfile);
//
//    memset(&sfinfo, 0, sizeof(sfinfo));
//
//    if (!(recordedFile = sf_open(outfilename, SFM_READ, &sfinfo))) {
//        LOGD(TAG, "Error : could not open recordedFile file ");
//        LOGD(TAG, sf_strerror(recordedFile));
//        exit(1);
//    };
//
//    LOGV(TAG, "writeToFile(): ==== RECORDED FILE INFO ==== ");
//
//    LOGV(TAG, "writeToFile(): sfinfo.frames = ");
//    LOGV(TAG, std::to_string(sfinfo.frames).c_str());
//
//    LOGV(TAG, "writeToFile(): sfinfo.channels = ");
//    LOGV(TAG, std::to_string(sfinfo.channels).c_str());
//
//    LOGV(TAG, "writeToFile(): sfinfo.format = ");
//    LOGV(TAG, std::to_string(sfinfo.format).c_str());
//
//    LOGV(TAG, "writeToFile(): sfinfo.samplerate = ");
//    LOGV(TAG, std::to_string(sfinfo.samplerate).c_str());
//
//    LOGV(TAG, "writeToFile(): ==== RECORDED FILE INFO ==== ");
//
//    sf_close(recordedFile);
//
//    LOGD(TAG, "writeToFile(): Done with writing file");
//
//}