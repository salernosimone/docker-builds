FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04

# Prevent interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive
# Activate "base" environment by default
ENV PATH=/opt/micromamba/bin:$PATH

# Install micromamba
ENV MAMBA_ROOT_PREFIX=/opt/micromamba
RUN apt-get update && \
    apt-get install -y curl ca-certificates git unzip gzip && \
    rm -rf /var/lib/apt/lists/* && \
    curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xj -C /usr/local/bin bin/micromamba --strip-components=1 && \
    chmod +x /usr/local/bin/micromamba && \
    micromamba create -y -n base python=3.11 && \
    micromamba clean --all --yes