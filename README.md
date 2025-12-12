# CppLab

VSCode DevContainer setup for C/C++ programmers

## 🚀 Overview

This repository provides a complete development environment for C and C++ programming using Visual Studio Code Dev Containers. It includes all the necessary tools, compilers, debuggers, and extensions to start coding immediately.

## 📋 Prerequisites

- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker](https://www.docker.com/get-started)
- [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension for VS Code

## 🛠️ What's Included

The Dev Container includes:

### Compilers & Build Tools
- **GCC** - GNU Compiler Collection
- **G++** - GNU C++ Compiler
- **Clang** - LLVM C/C++ Compiler
- **CMake** - Cross-platform build system
- **Make** - Build automation tool
- **Ninja** - Small build system with a focus on speed

### Debugging & Analysis Tools
- **GDB** - GNU Debugger
- **Valgrind** - Memory debugging and profiling
- **clang-tidy** - Static code analysis
- **clang-format** - Code formatting

### VS Code Extensions
- C/C++ Extension Pack
- CMake Tools
- Makefile Tools

### Additional Tools
- Git
- Python3
- Doxygen (documentation generation)
- Various development libraries

## 🚦 Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/jpedrodias/CppLab.git
   cd CppLab
   ```

2. **Open in VS Code:**
   ```bash
   code .
   ```

3. **Reopen in Container:**
   - Press `F1` (or `Ctrl+Shift+P` / `Cmd+Shift+P`)
   - Type: "Remote-Containers: Reopen in Container"
   - Wait for the container to build (first time only)

4. **Start coding!** The container is ready with all tools installed.

## 📁 Project Structure

```
CppLab/
├── .devcontainer/
│   ├── devcontainer.json    # Dev Container configuration
│   └── Dockerfile            # Container image definition
├── src/
│   ├── hello.c              # Sample C program
│   └── hello.cpp            # Sample C++ program
├── Makefile                 # Make build configuration
├── CMakeLists.txt           # CMake build configuration
└── README.md
```

## 🔨 Building and Running Examples

### Using Make

```bash
# Build all examples
make

# Run C example
./build/hello_c

# Run C++ example
./build/hello_cpp

# Clean build artifacts
make clean
```

### Using CMake

```bash
# Configure and build
mkdir -p build
cd build
cmake ..
make

# Run examples
./hello_c
./hello_cpp
```

### Direct Compilation

```bash
# Compile C program
gcc -Wall -Wextra -g src/hello.c -o hello_c

# Compile C++ program
g++ -Wall -Wextra -g -std=c++17 src/hello.cpp -o hello_cpp
```

## 🐛 Debugging

The Dev Container includes GDB for debugging. You can:

1. Set breakpoints in VS Code by clicking on the left margin
2. Press `F5` to start debugging
3. Use the Debug Console for interactive debugging

## 🎯 Features

- **Isolated Environment**: Your development environment is completely isolated from your host system
- **Consistent Setup**: Everyone on your team gets the exact same development environment
- **Easy to Share**: Just commit the `.devcontainer` folder to your repository
- **No Manual Setup**: No need to install compilers, tools, or dependencies manually
- **Cross-Platform**: Works on Windows, macOS, and Linux

## 📚 Next Steps

- Add your C/C++ source files to the `src/` directory
- Update `CMakeLists.txt` or `Makefile` for your project structure
- Configure IntelliSense settings in `.devcontainer/devcontainer.json`
- Install additional tools or libraries in `.devcontainer/Dockerfile`

## 🤝 Contributing

Feel free to submit issues and pull requests for improvements!

## 📄 License

This project is licensed under the terms specified in the LICENSE file.
