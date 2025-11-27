FROM salernosimone/gsplat:1.5.3

RUN apt update && \
    apt install -y libgl1 libglib2.0-0 ffmpeg && rm -rf /var/lib/apt/lists/* && \
    git clone https://github.com/salernosimone/Depth-Anything-3/tree/main

WORKDIR Depth-Anything-3
RUN TORCH_CUDA_ARCH_LIST="7.5 8.0 8.6 8.9 9.0" uv pip install --upgrade-strategy only-if-needed -r requirements.txt

WORKDIR Depth-Anything-3
RUN hf download depth-anything/DA3NESTED-GIANT-LARGE --local-dir checkpoints