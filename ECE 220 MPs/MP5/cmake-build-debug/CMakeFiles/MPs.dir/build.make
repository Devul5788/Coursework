# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2020.2.2\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2020.2.2\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "C:\Users\Devul Nahar\OneDrive - University of Illinois - Urbana\Documents\UIUC\Year 1\Semester 2\2. ECE 220\MPs\MP5"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "C:\Users\Devul Nahar\OneDrive - University of Illinois - Urbana\Documents\UIUC\Year 1\Semester 2\2. ECE 220\MPs\MP5\cmake-build-debug"

# Include any dependencies generated for this target.
include CMakeFiles/MPs.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/MPs.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MPs.dir/flags.make

CMakeFiles/MPs.dir/main.c.obj: CMakeFiles/MPs.dir/flags.make
CMakeFiles/MPs.dir/main.c.obj: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="C:\Users\Devul Nahar\OneDrive - University of Illinois - Urbana\Documents\UIUC\Year 1\Semester 2\2. ECE 220\MPs\MP5\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/MPs.dir/main.c.obj"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles\MPs.dir\main.c.obj   -c "C:\Users\Devul Nahar\OneDrive - University of Illinois - Urbana\Documents\UIUC\Year 1\Semester 2\2. ECE 220\MPs\MP5\main.c"

CMakeFiles/MPs.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MPs.dir/main.c.i"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "C:\Users\Devul Nahar\OneDrive - University of Illinois - Urbana\Documents\UIUC\Year 1\Semester 2\2. ECE 220\MPs\MP5\main.c" > CMakeFiles\MPs.dir\main.c.i

CMakeFiles/MPs.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MPs.dir/main.c.s"
	C:\PROGRA~1\MINGW-~1\X86_64~1.0-P\mingw64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "C:\Users\Devul Nahar\OneDrive - University of Illinois - Urbana\Documents\UIUC\Year 1\Semester 2\2. ECE 220\MPs\MP5\main.c" -o CMakeFiles\MPs.dir\main.c.s

# Object files for target MPs
MPs_OBJECTS = \
"CMakeFiles/MPs.dir/main.c.obj"

# External object files for target MPs
MPs_EXTERNAL_OBJECTS =

MPs.exe: CMakeFiles/MPs.dir/main.c.obj
MPs.exe: CMakeFiles/MPs.dir/build.make
MPs.exe: CMakeFiles/MPs.dir/linklibs.rsp
MPs.exe: CMakeFiles/MPs.dir/objects1.rsp
MPs.exe: CMakeFiles/MPs.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="C:\Users\Devul Nahar\OneDrive - University of Illinois - Urbana\Documents\UIUC\Year 1\Semester 2\2. ECE 220\MPs\MP5\cmake-build-debug\CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable MPs.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\MPs.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MPs.dir/build: MPs.exe

.PHONY : CMakeFiles/MPs.dir/build

CMakeFiles/MPs.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\MPs.dir\cmake_clean.cmake
.PHONY : CMakeFiles/MPs.dir/clean

CMakeFiles/MPs.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" "C:\Users\Devul Nahar\OneDrive - University of Illinois - Urbana\Documents\UIUC\Year 1\Semester 2\2. ECE 220\MPs\MP5" "C:\Users\Devul Nahar\OneDrive - University of Illinois - Urbana\Documents\UIUC\Year 1\Semester 2\2. ECE 220\MPs\MP5" "C:\Users\Devul Nahar\OneDrive - University of Illinois - Urbana\Documents\UIUC\Year 1\Semester 2\2. ECE 220\MPs\MP5\cmake-build-debug" "C:\Users\Devul Nahar\OneDrive - University of Illinois - Urbana\Documents\UIUC\Year 1\Semester 2\2. ECE 220\MPs\MP5\cmake-build-debug" "C:\Users\Devul Nahar\OneDrive - University of Illinois - Urbana\Documents\UIUC\Year 1\Semester 2\2. ECE 220\MPs\MP5\cmake-build-debug\CMakeFiles\MPs.dir\DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/MPs.dir/depend
