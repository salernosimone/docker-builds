FROM nvidia/cuda:12.4.0-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    ninja-build \
    ccache \
    pkg-config \
    wget \
    unzip \
    ca-certificates \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    libboost-system-dev \
    libboost-graph-dev \
    libeigen3-dev \
    libflann-dev \
    libfreeimage-dev \
    libmetis-dev \
    libgoogle-glog-dev \
    libgflags-dev \
    libsqlite3-dev \
    libsuitesparse-dev \
    libatlas-base-dev \
    libopenblas-dev \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

ENV CMAKE_CXX_COMPILER_LAUNCHER=ccache
ENV CUDA_ARCHITECTURES="75;80;86;89;90"
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb \
    && dpkg -i cuda-keyring_1.1-1_all.deb \
    && apt-get update \
    && apt-get -y install cudss
RUN git clone https://github.com/salernosimone/ceres-solver.git && cd ceres-solver && \
    git submodule update --init --recursive && \
    mkdir build && cd build \
    && cmake .. \
       -DCMAKE_BUILD_TYPE=Release \
       -DBUILD_TESTING=OFF \
       -DCMAKE_CXX_STANDARD=17 \
       -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
       -DCMAKE_INSTALL_PREFIX=/usr/local \
       -DCMAKE_CUDA_ARCHITECTURES="${CUDA_ARCHITECTURES}" \
       -DUSE_CUDA=ON
    && make -j$(nproc) \
    && make install