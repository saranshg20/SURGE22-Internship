#include "RecordingCallback.h"

oboe::DataCallbackResult
RecordingCallback::onAudioReady(oboe::AudioStream *audioStream, void *audioData, int32_t numFrames, int offset) {
    return processRecordingFrames(audioStream, static_cast<int16_t *>(audioData), numFrames * audioStream->getChannelCount(), offset);
}

oboe::DataCallbackResult
RecordingCallback::processRecordingFrames(oboe::AudioStream *audioStream, int16_t *audioData, int32_t numFrames, int offset) {

//    mSoundRecording->calculateCurrentOutputLatencyMillis(
//            reinterpret_cast<AAudioStream *>(audioStream), &currentOutputLatencyMillis);

//    audioStreamAAudio = dynamic_cast<oboe::AudioStreamAAudio *>(audioStream);
//    oboe::ResultWithValue<double> ans = audioStreamAAudio->calculateLatencyMillis();


//    latencyStatistics(audioStream);

    int32_t framesWritten = mSoundRecording->write(audioData, numFrames, offset);
    LOGD(TAG, "processRecordingFrames(): framesWritten:");
    LOGD(TAG, to_string_with_precision(framesWritten).c_str());
//    LOGD(TAG, to_string_with_precision(ans.value()).c_str());
//    LOGD(TAG, to_string_with_precision(latencyMillis).c_str());
    return oboe::DataCallbackResult::Continue;

}

//void RecordingCallback::latencyStatistics(oboe::AudioStream *stream){
//// Get the index and time that a known audio frame was presented for playing
//    int64_t existingFrameIndex;
//    int64_t existingFramePresentationTime;
//    AAudioStream_getTimestamp(reinterpret_cast<AAudioStream *>(stream), CLOCK_MONOTONIC, &existingFrameIndex, &existingFramePresentationTime);
//
//// Get the write index for the next audio frame
//    int64_t writeIndex = AAudioStream_getFramesWritten(reinterpret_cast<AAudioStream *>(stream));
//
//// Calculate the number of frames between our known frame and the write index
//    int64_t frameIndexDelta = writeIndex - existingFrameIndex;
//
//// Calculate the time which the next frame will be presented
//    int64_t frameTimeDelta = (frameIndexDelta * oboe::kNanosPerSecond) / mSoundRecording->mSampleRate;
//    int64_t nextFramePresentationTime = existingFramePresentationTime + frameTimeDelta;
//
//// Assume that the next frame will be written into the stream at the current time
//    int64_t nextFrameWriteTime = get_time_nanoseconds(CLOCK_MONOTONIC);
//
//// Calculate the latency
//    latencyMillis = (double) (nextFramePresentationTime - nextFrameWriteTime) / oboe::kNanosPerMillisecond;
//}
//
//int64_t RecordingCallback::get_time_nanoseconds(int i) {
//    return i*1e9;
//}
