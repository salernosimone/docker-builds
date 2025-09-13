FROM salernosimone/cuda-conda:12.4

WORKDIR /app
RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main && \
    conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r && \
    conda create -n torch python=3.10.13 cmake=3.14.0 -y
SHELL ["/bin/bash", "-c"]
ENV PATH /opt/conda/envs/torch/bin:$PATH
ENV CONDA_DEFAULT_ENV torch
RUN conda install -y ninja pytorch=2.4 torchvision pytorch-cuda=12.4 -c pytorch -c nvidia -c conda-forge