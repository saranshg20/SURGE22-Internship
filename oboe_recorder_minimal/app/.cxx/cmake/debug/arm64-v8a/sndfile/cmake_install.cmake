# Install script for directory: C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/Project")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/libsndfile.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile/src/sndfile.hh"
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/src/sndfile.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/sndfile-info")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-info" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-info")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "C:/Users/Hp/AppData/Local/Android/Sdk/ndk/21.1.6352462/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android-strip.exe" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-info")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/sndfile-play")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-play" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-play")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "C:/Users/Hp/AppData/Local/Android/Sdk/ndk/21.1.6352462/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android-strip.exe" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-play")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/sndfile-convert")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-convert" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-convert")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "C:/Users/Hp/AppData/Local/Android/Sdk/ndk/21.1.6352462/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android-strip.exe" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-convert")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/sndfile-cmp")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-cmp" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-cmp")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "C:/Users/Hp/AppData/Local/Android/Sdk/ndk/21.1.6352462/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android-strip.exe" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-cmp")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/sndfile-metadata-set")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-metadata-set" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-metadata-set")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "C:/Users/Hp/AppData/Local/Android/Sdk/ndk/21.1.6352462/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android-strip.exe" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-metadata-set")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/sndfile-metadata-get")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-metadata-get" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-metadata-get")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "C:/Users/Hp/AppData/Local/Android/Sdk/ndk/21.1.6352462/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android-strip.exe" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-metadata-get")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/sndfile-interleave")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-interleave" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-interleave")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "C:/Users/Hp/AppData/Local/Android/Sdk/ndk/21.1.6352462/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android-strip.exe" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-interleave")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/sndfile-deinterleave")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-deinterleave" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-deinterleave")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "C:/Users/Hp/AppData/Local/Android/Sdk/ndk/21.1.6352462/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android-strip.exe" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-deinterleave")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/sndfile-concat")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-concat" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-concat")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "C:/Users/Hp/AppData/Local/Android/Sdk/ndk/21.1.6352462/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android-strip.exe" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-concat")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/sndfile-salvage")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-salvage" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-salvage")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "C:/Users/Hp/AppData/Local/Android/Sdk/ndk/21.1.6352462/toolchains/llvm/prebuilt/windows-x86_64/bin/aarch64-linux-android-strip.exe" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/sndfile-salvage")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SndFile/SndFileConfig.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SndFile/SndFileConfig.cmake"
         "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/CMakeFiles/Export/lib/cmake/SndFile/SndFileConfig.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SndFile/SndFileConfig-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SndFile/SndFileConfig.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SndFile" TYPE FILE FILES "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/CMakeFiles/Export/lib/cmake/SndFile/SndFileConfig.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SndFile" TYPE FILE FILES "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/CMakeFiles/Export/lib/cmake/SndFile/SndFileConfig-debug.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SndFile" TYPE FILE FILES "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/SndFileConfigVersion.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/libsndfile" TYPE FILE FILES
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile/doc/index.html"
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile/doc/libsndfile.jpg"
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/doc/libsndfile.css"
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile/doc/print.css"
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile/doc/api.html"
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile/doc/command.html"
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile/doc/bugs.html"
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile/doc/sndfile_info.html"
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile/doc/new_file_type.HOWTO"
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile/doc/win32.html"
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile/doc/FAQ.html"
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile/doc/lists.html"
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile/doc/embedded_files.html"
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile/doc/octave.html"
    "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/libsndfile/doc/tutorial.html"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "C:/Users/Hp/OneDrive/Desktop/Oboe-minimal/Oboe-Regular-Updates/Oboe-minimal/oboe_recorder_minimal/app/.cxx/cmake/debug/arm64-v8a/sndfile/sndfile.pc")
endif()

