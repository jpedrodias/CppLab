# Use Ubuntu as base image
FROM ubuntu:22.04

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Configure apt and install packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends \
    # Common development tools
    build-essential \
    gcc \
    g++ \
    gdb \
    clang \
    clang-format \
    clang-tidy \
    cmake \
    make \
    ninja-build \
    # Additional useful tools
    git \
    wget \
    curl \
    vim \
    nano \
    # Library development files
    libssl-dev \
    pkg-config \
    # Python for scripts/utilities
    python3 \
    python3-pip \
    # Valgrind for memory debugging
    valgrind \
    # Documentation tools
    doxygen \
    # Utilities
    locales \
    sudo \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Create a non-root user to use
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog

# Set the default user
USER $USERNAME
