# Base image with CUDA 12.6
FROM nvidia/cuda:12.6.0-runtime-ubuntu22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    PATH=/opt/conda/bin:$PATH

# Install system packages and Anaconda
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        wget \
        curl \
        git \
        ca-certificates \
        bzip2 \
        libglib2.0-0 \
        libxext6 \
        libsm6 \
        libxrender1 \
        libssl-dev \
        libffi-dev \
        libgl1 \
        ffmpeg \
        && rm -rf /var/lib/apt/lists/*

# Install Anaconda (latest stable version)
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2025.06-1-Linux-x86_64.sh -O /tmp/anaconda.sh && \
    bash /tmp/anaconda.sh -b -p /opt/conda && \
    rm /tmp/anaconda.sh && \
    /opt/conda/bin/conda clean -afy

CMD ["/bin/bash"]
