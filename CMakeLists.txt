cmake_minimum_required(VERSION 3.10)
project(CppLab VERSION 1.0)

# Set C and C++ standards
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add compile options
add_compile_options(-Wall -Wextra)

# C executable
add_executable(hello_c src/hello.c)

# C++ executable
add_executable(hello_cpp src/hello.cpp)
