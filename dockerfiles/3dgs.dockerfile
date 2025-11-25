FROM salernosimone/torch:py311-cu124
RUN apt update && apt install -y libgl1 ffmpeg libglew-dev libassimp-dev libboost-all-dev libgtk-3-dev libopencv-dev libglfw3-dev libavdevice-dev libavcodec-dev libeigen3-dev libxxf86vm-dev libembree-dev
ENV TORCH_CUDA_ARCH_LIST "7.5;8.0;8.6;8.9;9.0"
RUN git clone https://github.com/graphdeco-inria/gaussian-splatting --recursive && \
    cd aussian-splatting && \
    micromamba install opencv-python joblib plyfile tqdm && \
    pip install submodules/simple-knn && \
    pip install submodules/fused-ssim && \
    git clone https://github.com/DepthAnything/Depth-Anything-V2.git && mkdir -p Depth-Anything-V2/checkpoints/ && wget -O Depth-Anything-V2/checkpoints/depth_anything_v2_vitl.pth "https://huggingface.co/depth-anything/Depth-Anything-V2-Large/resolve/main/depth_anything_v2_vitl.pth?download=true" && \
    cd submodules/diff-gaussian-rasterization && git checkout 3dgs_accel && pip install .