# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.12

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/ngs/Documents/cplusproject/Thunder-master

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/ngs/Documents/cplusproject/Thunder-master/cmake-build-debug

# Include any dependencies generated for this target.
include packages/storage/CMakeFiles/thunder_storage.dir/depend.make

# Include the progress variables for this target.
include packages/storage/CMakeFiles/thunder_storage.dir/progress.make

# Include the compile flags for this target's objects.
include packages/storage/CMakeFiles/thunder_storage.dir/flags.make

packages/storage/CMakeFiles/thunder_storage.dir/src/storage.cpp.o: packages/storage/CMakeFiles/thunder_storage.dir/flags.make
packages/storage/CMakeFiles/thunder_storage.dir/src/storage.cpp.o: ../packages/storage/src/storage.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/ngs/Documents/cplusproject/Thunder-master/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object packages/storage/CMakeFiles/thunder_storage.dir/src/storage.cpp.o"
	cd /Users/ngs/Documents/cplusproject/Thunder-master/cmake-build-debug/packages/storage && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/thunder_storage.dir/src/storage.cpp.o -c /Users/ngs/Documents/cplusproject/Thunder-master/packages/storage/src/storage.cpp

packages/storage/CMakeFiles/thunder_storage.dir/src/storage.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/thunder_storage.dir/src/storage.cpp.i"
	cd /Users/ngs/Documents/cplusproject/Thunder-master/cmake-build-debug/packages/storage && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/ngs/Documents/cplusproject/Thunder-master/packages/storage/src/storage.cpp > CMakeFiles/thunder_storage.dir/src/storage.cpp.i

packages/storage/CMakeFiles/thunder_storage.dir/src/storage.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/thunder_storage.dir/src/storage.cpp.s"
	cd /Users/ngs/Documents/cplusproject/Thunder-master/cmake-build-debug/packages/storage && /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/ngs/Documents/cplusproject/Thunder-master/packages/storage/src/storage.cpp -o CMakeFiles/thunder_storage.dir/src/storage.cpp.s

# Object files for target thunder_storage
thunder_storage_OBJECTS = \
"CMakeFiles/thunder_storage.dir/src/storage.cpp.o"

# External object files for target thunder_storage
thunder_storage_EXTERNAL_OBJECTS =

packages/storage/libthunder_storage.dylib: packages/storage/CMakeFiles/thunder_storage.dir/src/storage.cpp.o
packages/storage/libthunder_storage.dylib: packages/storage/CMakeFiles/thunder_storage.dir/build.make
packages/storage/libthunder_storage.dylib: packages/serializer/libthunder_serializer.dylib
packages/storage/libthunder_storage.dylib: packages/exception/libthunder_exception.dylib
packages/storage/libthunder_storage.dylib: packages/storage/CMakeFiles/thunder_storage.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/ngs/Documents/cplusproject/Thunder-master/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libthunder_storage.dylib"
	cd /Users/ngs/Documents/cplusproject/Thunder-master/cmake-build-debug/packages/storage && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/thunder_storage.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
packages/storage/CMakeFiles/thunder_storage.dir/build: packages/storage/libthunder_storage.dylib

.PHONY : packages/storage/CMakeFiles/thunder_storage.dir/build

packages/storage/CMakeFiles/thunder_storage.dir/clean:
	cd /Users/ngs/Documents/cplusproject/Thunder-master/cmake-build-debug/packages/storage && $(CMAKE_COMMAND) -P CMakeFiles/thunder_storage.dir/cmake_clean.cmake
.PHONY : packages/storage/CMakeFiles/thunder_storage.dir/clean

packages/storage/CMakeFiles/thunder_storage.dir/depend:
	cd /Users/ngs/Documents/cplusproject/Thunder-master/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ngs/Documents/cplusproject/Thunder-master /Users/ngs/Documents/cplusproject/Thunder-master/packages/storage /Users/ngs/Documents/cplusproject/Thunder-master/cmake-build-debug /Users/ngs/Documents/cplusproject/Thunder-master/cmake-build-debug/packages/storage /Users/ngs/Documents/cplusproject/Thunder-master/cmake-build-debug/packages/storage/CMakeFiles/thunder_storage.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : packages/storage/CMakeFiles/thunder_storage.dir/depend

