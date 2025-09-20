FROM salernosimone/torch:cu124

WORKDIR /app
RUN git clone https://github.com/facebookresearch/pytorch3d.git && cd pytorch3d && git checkout stable && MAX_JOBS=$(nproc) CUDA_HOME=/usr/local/cuda FORCE_CUDA="1" TORCH_CUDA_ARCH_LIST="8.0;8.9" CMAKE_GENERATOR=Ninja BUILD_TESTS=OFF BUILD_BENCHMARKS=OFF pip install --verbose .