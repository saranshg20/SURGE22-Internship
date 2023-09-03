# CMake generated Testfile for 
# Source directory: C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/oboe_recorder_minimal/libsndfile
# Build directory: C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/release/x86_64/sndfile
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_main "test_main")
add_test(sfversion "sfversion")
set_tests_properties(sfversion PROPERTIES  PASS_REGULAR_EXPRESSION "libsndfile-1.0.29pre1")
add_test(error_test "error_test")
add_test(ulaw_test "ulaw_test")
add_test(alaw_test "alaw_test")
add_test(dwvw_test "dwvw_test")
add_test(command_test "command_test" "all")
add_test(floating_point_test "floating_point_test")
add_test(checksum_test "checksum_test")
add_test(scale_clip_test "scale_clip_test")
add_test(headerless_test "headerless_test")
add_test(rdwr_test "rdwr_test")
add_test(locale_test "locale_test")
add_test(cpp_test "cpp_test")
add_test(external_libs_test "external_libs_test")
add_test(format_check_test "format_check_test")
add_test(channel_test "channel_test")
add_test(pcm_test "pcm_test")
add_test(g72x_test "g72x_test" "all")
add_test(write_read_test_aiff "write_read_test" "aiff")
add_test(lossy_comp_test_aiff_ulaw "lossy_comp_test" "aiff_ulaw")
add_test(lossy_comp_test_aiff_alaw "lossy_comp_test" "aiff_alaw")
add_test(lossy_comp_test_aiff_gsm610 "lossy_comp_test" "aiff_gsm610")
add_test(peak_chunk_test_aiff "peak_chunk_test" "aiff")
add_test(header_test_aiff "header_test" "aiff")
add_test(misc_test_aiff "misc_test" "aiff")
add_test(string_test_aiff "string_test" "aiff")
add_test(multi_file_test_aiff "multi_file_test" "aiff")
add_test(aiff_rw_test "aiff_rw_test")
add_test(write_read_test_au "write_read_test" "au")
add_test(lossy_comp_test_au_ulaw "lossy_comp_test" "au_ulaw")
add_test(lossy_comp_test_au_alaw "lossy_comp_test" "au_alaw")
add_test(lossy_comp_test_au_g721 "lossy_comp_test" "au_g721")
add_test(lossy_comp_test_au_g723 "lossy_comp_test" "au_g723")
add_test(header_test_au "header_test" "au")
add_test(misc_test_au "misc_test" "au")
add_test(multi_file_test_au "multi_file_test" "au")
add_test(write_read_test_caf "write_read_test" "caf")
add_test(lossy_comp_test_caf_ulaw "lossy_comp_test" "caf_ulaw")
add_test(lossy_comp_test_caf_alaw "lossy_comp_test" "caf_alaw")
add_test(header_test_caf "header_test" "caf")
add_test(peak_chunk_test_caf "peak_chunk_test" "caf")
add_test(misc_test_caf "misc_test" "caf")
add_test(chunk_test_caf "chunk_test" "caf")
add_test(string_test_caf "string_test" "caf")
add_test(long_read_write_test_alac "long_read_write_test" "alac")
add_test(write_read_test_wav "write_read_test" "wav")
add_test(lossy_comp_test_wav_pcm "lossy_comp_test" "wav_pcm")
add_test(lossy_comp_test_wav_ima "lossy_comp_test" "wav_ima")
add_test(lossy_comp_test_wav_msadpcm "lossy_comp_test" "wav_msadpcm")
add_test(lossy_comp_test_wav_ulaw "lossy_comp_test" "wav_ulaw")
add_test(lossy_comp_test_wav_alaw "lossy_comp_test" "wav_alaw")
add_test(lossy_comp_test_wav_gsm610 "lossy_comp_test" "wav_gsm610")
add_test(lossy_comp_test_wav_g721 "lossy_comp_test" "wav_g721")
add_test(lossy_comp_test_wav_nmsadpcm "lossy_comp_test" "wav_nmsadpcm")
add_test(peak_chunk_test_wav "peak_chunk_test" "wav")
add_test(header_test_wav "header_test" "wav")
add_test(misc_test_wav "misc_test" "wav")
add_test(string_test_wav "string_test" "wav")
add_test(multi_file_test_wav "multi_file_test" "wav")
add_test(chunk_test_wav "chunk_test" "wav")
add_test(write_read_test_w64 "write_read_test" "w64")
add_test(lossy_comp_test_w64_ima "lossy_comp_test" "w64_ima")
add_test(lossy_comp_test_w64_msadpcm "lossy_comp_test" "w64_msadpcm")
add_test(lossy_comp_test_w64_ulaw "lossy_comp_test" "w64_ulaw")
add_test(lossy_comp_test_w64_alaw "lossy_comp_test" "w64_alaw")
add_test(lossy_comp_test_w64_gsm610 "lossy_comp_test" "w64_gsm610")
add_test(header_test_w64 "header_test" "w64")
add_test(misc_test_w64 "misc_test" "w64")
add_test(write_read_test_rf64 "write_read_test" "rf64")
add_test(header_test_rf64 "header_test" "rf64")
add_test(misc_test_rf64 "misc_test" "rf64")
add_test(string_test_rf64 "string_test" "rf64")
add_test(peak_chunk_test_rf64 "peak_chunk_test" "rf64")
add_test(chunk_test_rf64 "chunk_test" "rf64")
add_test(write_read_test_raw "write_read_test" "raw")
add_test(lossy_comp_test_raw_ulaw "lossy_comp_test" "raw_ulaw")
add_test(lossy_comp_test_raw_alaw "lossy_comp_test" "raw_alaw")
add_test(lossy_comp_test_raw_gsm610 "lossy_comp_test" "raw_gsm610")
add_test(lossy_comp_test_vox_adpcm "lossy_comp_test" "vox_adpcm")
add_test(raw_test "raw_test")
add_test(write_read_test_paf "write_read_test" "paf")
add_test(header_test_paf "header_test" "paf")
add_test(misc_test_paf "misc_test" "paf")
add_test(write_read_test_svx "write_read_test" "svx")
add_test(header_test_svx "header_test" "svx")
add_test(misc_test_svx "misc_test" "svx")
add_test(write_read_test_nist "write_read_test" "nist")
add_test(lossy_comp_test_nist_ulaw "lossy_comp_test" "nist_ulaw")
add_test(lossy_comp_test_nist_alaw "lossy_comp_test" "nist_alaw")
add_test(header_test_nist "header_test" "nist")
add_test(misc_test_nist "misc_test" "nist")
add_test(write_read_test_ircam "write_read_test" "ircam")
add_test(lossy_comp_test_ircam_ulaw "lossy_comp_test" "ircam_ulaw")
add_test(lossy_comp_test_ircam_alaw "lossy_comp_test" "ircam_alaw")
add_test(header_test_ircam "header_test" "ircam")
add_test(misc_test_ircam "misc_test" "ircam")
add_test(write_read_test_voc "write_read_test" "voc")
add_test(lossy_comp_test_voc_ulaw "lossy_comp_test" "voc_ulaw")
add_test(lossy_comp_test_voc_alaw "lossy_comp_test" "voc_alaw")
add_test(header_test_voc "header_test" "voc")
add_test(misc_test_voc "misc_test" "voc")
add_test(write_read_test_mat4 "write_read_test" "mat4")
add_test(header_test_mat4 "header_test" "mat4")
add_test(misc_test_mat4 "misc_test" "mat4")
add_test(write_read_test_mat5 "write_read_test" "mat5")
add_test(header_test_mat5 "header_test" "mat5")
add_test(misc_test_mat5 "misc_test" "mat5")
add_test(write_read_test_pvf "write_read_test" "pvf")
add_test(header_test_pvf "header_test" "pvf")
add_test(misc_test_pvf "misc_test" "pvf")
add_test(lossy_comp_test_xi_dpcm "lossy_comp_test" "xi_dpcm")
add_test(write_read_test_htk "write_read_test" "htk")
add_test(header_test_htk "header_test" "htk")
add_test(misc_test_htk "misc_test" "htk")
add_test(write_read_test_avr "write_read_test" "avr")
add_test(header_test_avr "header_test" "avr")
add_test(misc_test_avr "misc_test" "avr")
add_test(write_read_test_sds "write_read_test" "sds")
add_test(header_test_sds "header_test" "sds")
add_test(misc_test_sds "misc_test" "sds")
add_test(write_read_test_sd2 "write_read_test" "sd2")
add_test(lossy_comp_test_wve "lossy_comp_test" "wve")
add_test(write_read_test_mpc2k "write_read_test" "mpc2k")
add_test(header_test_mpc2k "header_test" "mpc2k")
add_test(misc_test_mpc2k "misc_test" "mpc2k")
add_test(write_read_test_flac "write_read_test" "flac")
add_test(compression_size_test_flac "compression_size_test" "flac")
add_test(string_test_flac "string_test" "flac")
add_test(ogg_test "ogg_test")
add_test(compression_size_test_vorbis "compression_size_test" "vorbis")
add_test(lossy_comp_test_ogg_vorbis "lossy_comp_test" "ogg_vorbis")
add_test(string_test_ogg "string_test" "ogg")
add_test(misc_test_ogg "misc_test" "ogg")
add_test(ogg_opus_test "ogg_opus_test")
add_test(compression_size_test_opus "compression_size_test" "opus")
add_test(lossy_comp_test_ogg_opus "lossy_comp_test" "ogg_opus")
add_test(string_test_opus "string_test" "opus")
add_test(stdio_test "stdio_test")
add_test(pipe_test "pipe_test")
add_test(virtual_io_test "virtual_io_test")
