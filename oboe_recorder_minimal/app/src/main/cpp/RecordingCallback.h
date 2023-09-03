#ifndef OBOE_RECORDER_RECORDINGCALLBACK_H
#define OBOE_RECORDER_RECORDINGCALLBACK_H


#include <oboe/Definitions.h>
#include <oboe/AudioStream.h>
#include "SoundRecording.h"
#include "logging_macros.h"
//#include "aaudio/AAudio.h"
#include "aaudio/AudioStreamAAudio.h"

#ifndef MODULE_NAME
#define MODULE_NAME  "RecordingCallback"
#endif


class RecordingCallback : public oboe::AudioStreamCallback {

private:
    const char* TAG = "RecordingCallback:: %s";
    SoundRecording* mSoundRecording = nullptr;
//    double latencyMillis;
//    oboe::AudioStreamAAudio* audioStreamAAudio = nullptr;

public:
    RecordingCallback() = default;

    explicit RecordingCallback(SoundRecording* recording) {
        mSoundRecording = recording;
    }

    oboe::DataCallbackResult
    onAudioReady(oboe::AudioStream *audioStream, void *audioData, int32_t numFrames, int offset);

    oboe::DataCallbackResult
    processRecordingFrames(oboe::AudioStream *audioStream, int16_t *audioData, int32_t numFrames, int offset);

//     void latencyStatistics(oboe::AudioStream *stream);
//    int64_t get_time_nanoseconds(int i);
};

#endif //OBOE_RECORDER_RECORDINGCALLBACK_H
