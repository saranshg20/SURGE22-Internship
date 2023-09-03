
#ifndef OBOE_RECORDER_SOUNDRECORDING_H
#define OBOE_RECORDER_SOUNDRECORDING_H

#ifndef MODULE_NAME
#define MODULE_NAME  "SoundRecording"
#endif


#include <cstdint>
#include <array>
#include <atomic>
#include <sndfile.hh>
#include <oboe/Definitions.h>
#include <android/log.h>
#include <string>
#include <ios>
#include <sstream>
#include "SoundRecording.h"
#include "logging_macros.h"
#include "aaudio/AAudio.h"
#include "Utils.h"


constexpr int kMaxSamples = 480000; // 10s of audio data @ 48kHz

class SoundRecording {

public:
    int16_t offsetVal = 1;
    int32_t write(const int16_t *sourceData, int32_t numSamples, int offset);
    int32_t read(int16_t *targetData, int32_t numSamples);

    void initiateWritingToFile(const char *outfilename, int32_t outputChannels, int32_t sampleRate);
    SndfileHandle createFile(const char *outfilename, int32_t outputChannels, int32_t sampleRate);
    void writeFile(SndfileHandle sndfileHandle);
    void readFileInfo(const char * fileName);

    bool isFull() const { return (mWriteIndex == kMaxSamples); };
    void setReadPositionToStart() { mReadIndex = 0; };
    void clear() { mWriteIndex = 0; };
    void setLooping(bool isLooping) { mIsLooping = isLooping; };
    int32_t getLength() const { return mWriteIndex; };
    int32_t getTotalSamples() const { return mTotalSamples; };
    static const int32_t getMaxSamples() { return kMaxSamples; };

    void setOffsetValue(int i);

    void setGainFactor(double d);

    void setSampleRateFactor(double d);
    int32_t mSampleRate = oboe::kUnspecified;
    int countOfBuffers;

private:
    const char* TAG = "SoundRecording:: %s";

    std::atomic<int32_t> mIteration { 1 };
    std::atomic<int32_t> mWriteIndex { 0 };
    std::atomic<int32_t> mReadIndex { 0 };
    std::atomic<int32_t> mTotalSamples { 0 };
    std::atomic<bool> mIsLooping { false };
    int16_t* mData = new int16_t[kMaxSamples]{0};
    int countOfIteration = 0;

    // 6 Decibels gain on audio signal
    //Gain of 2.0 makes the output of high pitch...unpleasant sound
    float gain_factor = 1;
    float sampleRateFactor = 1;

//    int64_t get_time_nanoseconds(int i);
};

#endif //OBOE_RECORDER_SOUNDRECORDING_H
