# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build

# Include any dependencies generated for this target.
include LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/depend.make

# Include the progress variables for this target.
include LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/progress.make

# Include the compile flags for this target's objects.
include LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/flags.make

LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.o: LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/flags.make
LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.o: ../LimeRFE_8001P/examples/LimeRFE_8001P_example.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.o"
	cd /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/LimeRFE_8001P/examples && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.o -c /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/LimeRFE_8001P/examples/LimeRFE_8001P_example.cpp

LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.i"
	cd /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/LimeRFE_8001P/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/LimeRFE_8001P/examples/LimeRFE_8001P_example.cpp > CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.i

LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.s"
	cd /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/LimeRFE_8001P/examples && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/LimeRFE_8001P/examples/LimeRFE_8001P_example.cpp -o CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.s

LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.o.requires:

.PHONY : LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.o.requires

LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.o.provides: LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.o.requires
	$(MAKE) -f LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/build.make LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.o.provides.build
.PHONY : LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.o.provides

LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.o.provides.build: LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.o


# Object files for target LimeRFE_8001P_example
LimeRFE_8001P_example_OBJECTS = \
"CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.o"

# External object files for target LimeRFE_8001P_example
LimeRFE_8001P_example_EXTERNAL_OBJECTS =

bin/LimeRFE_8001P_example: LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.o
bin/LimeRFE_8001P_example: LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/build.make
bin/LimeRFE_8001P_example: LimeRFE_8001P/libLimeRFE_8001PAPI.so
bin/LimeRFE_8001P_example: LimeRFE_8001P/LMS8001/liblms8suite.a
bin/LimeRFE_8001P_example: LimeRFE_8001P/LMS8001/libLMS8API.so
bin/LimeRFE_8001P_example: LimeRFE_8001P/LMS8001/ADF4002/libADF4002.a
bin/LimeRFE_8001P_example: LimeRFE_8001P/LMS8001/Si5351C/libSi5351C.a
bin/LimeRFE_8001P_example: LimeRFE_8001P/LMS8001/lms8001_wxgui/liblms8001_wxgui.a
bin/LimeRFE_8001P_example: LimeRFE_8001P/LMS8001/utilities_gui/libutilities_gui.a
bin/LimeRFE_8001P_example: LimeRFE_8001P/LMS8001/lms8001/libLMS8001.a
bin/LimeRFE_8001P_example: LimeRFE_8001P/LMS8001/lms8suiteEvents/liblms8suiteEvents.a
bin/LimeRFE_8001P_example: LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/LimeRFE_8001P_example"
	cd /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/LimeRFE_8001P/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/LimeRFE_8001P_example.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/build: bin/LimeRFE_8001P_example

.PHONY : LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/build

LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/requires: LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/LimeRFE_8001P_example.cpp.o.requires

.PHONY : LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/requires

LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/clean:
	cd /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/LimeRFE_8001P/examples && $(CMAKE_COMMAND) -P CMakeFiles/LimeRFE_8001P_example.dir/cmake_clean.cmake
.PHONY : LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/clean

LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/depend:
	cd /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1 /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/LimeRFE_8001P/examples /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/LimeRFE_8001P/examples /home/limenet1/Work/LimeSDR_X3/LimeRFE_8001P/SW/LimeRFE_8001P_1v1/build/LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : LimeRFE_8001P/examples/CMakeFiles/LimeRFE_8001P_example.dir/depend

