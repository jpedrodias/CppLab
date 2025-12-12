# Compiler settings
CC = gcc
CXX = g++
CFLAGS = -Wall -Wextra -g
CXXFLAGS = -Wall -Wextra -g -std=c++17

# Directories
SRC_DIR = src
BUILD_DIR = build

# Targets
all: $(BUILD_DIR)/hello_c $(BUILD_DIR)/hello_cpp

$(BUILD_DIR)/hello_c: $(SRC_DIR)/hello.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) $< -o $@

$(BUILD_DIR)/hello_cpp: $(SRC_DIR)/hello.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $< -o $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
