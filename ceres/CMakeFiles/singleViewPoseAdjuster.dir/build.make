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
CMAKE_SOURCE_DIR = /home/ys/rrc/PoseShapeOptimization/ceres

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ys/rrc/PoseShapeOptimization/ceres

# Include any dependencies generated for this target.
include CMakeFiles/singleViewPoseAdjuster.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/singleViewPoseAdjuster.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/singleViewPoseAdjuster.dir/flags.make

CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.o: CMakeFiles/singleViewPoseAdjuster.dir/flags.make
CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.o: singleViewPoseAdjuster.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ys/rrc/PoseShapeOptimization/ceres/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.o -c /home/ys/rrc/PoseShapeOptimization/ceres/singleViewPoseAdjuster.cc

CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ys/rrc/PoseShapeOptimization/ceres/singleViewPoseAdjuster.cc > CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.i

CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ys/rrc/PoseShapeOptimization/ceres/singleViewPoseAdjuster.cc -o CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.s

CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.o.requires:

.PHONY : CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.o.requires

CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.o.provides: CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.o.requires
	$(MAKE) -f CMakeFiles/singleViewPoseAdjuster.dir/build.make CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.o.provides.build
.PHONY : CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.o.provides

CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.o.provides.build: CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.o


# Object files for target singleViewPoseAdjuster
singleViewPoseAdjuster_OBJECTS = \
"CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.o"

# External object files for target singleViewPoseAdjuster
singleViewPoseAdjuster_EXTERNAL_OBJECTS =

singleViewPoseAdjuster: CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.o
singleViewPoseAdjuster: CMakeFiles/singleViewPoseAdjuster.dir/build.make
singleViewPoseAdjuster: /usr/local/lib/libceres.a
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libglog.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libgflags.so.2.2.1
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libspqr.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libtbbmalloc.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libtbb.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libcholmod.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libccolamd.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libcamd.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libcolamd.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libamd.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/liblapack.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libf77blas.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libatlas.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libsuitesparseconfig.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/librt.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libcxsparse.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/liblapack.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libf77blas.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libatlas.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libsuitesparseconfig.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/librt.so
singleViewPoseAdjuster: /usr/lib/x86_64-linux-gnu/libcxsparse.so
singleViewPoseAdjuster: CMakeFiles/singleViewPoseAdjuster.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ys/rrc/PoseShapeOptimization/ceres/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable singleViewPoseAdjuster"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/singleViewPoseAdjuster.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/singleViewPoseAdjuster.dir/build: singleViewPoseAdjuster

.PHONY : CMakeFiles/singleViewPoseAdjuster.dir/build

CMakeFiles/singleViewPoseAdjuster.dir/requires: CMakeFiles/singleViewPoseAdjuster.dir/singleViewPoseAdjuster.cc.o.requires

.PHONY : CMakeFiles/singleViewPoseAdjuster.dir/requires

CMakeFiles/singleViewPoseAdjuster.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/singleViewPoseAdjuster.dir/cmake_clean.cmake
.PHONY : CMakeFiles/singleViewPoseAdjuster.dir/clean

CMakeFiles/singleViewPoseAdjuster.dir/depend:
	cd /home/ys/rrc/PoseShapeOptimization/ceres && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ys/rrc/PoseShapeOptimization/ceres /home/ys/rrc/PoseShapeOptimization/ceres /home/ys/rrc/PoseShapeOptimization/ceres /home/ys/rrc/PoseShapeOptimization/ceres /home/ys/rrc/PoseShapeOptimization/ceres/CMakeFiles/singleViewPoseAdjuster.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/singleViewPoseAdjuster.dir/depend

