FROM salernosimone/torch3d:cu124
WORKDIR /app
ENV TORCH_CUDA_ARCH_LIST "8.0;8.9"
RUN git clone --recursive https://github.com/salernosimone/LongSplat.git && \
    cd LongSplat && \
    pip install torch-scatter -f https://data.pyg.org/whl/torch-2.4.1+cu124.html && \
    pip install -r requirements.txt && \
    pip install submodules/simple-knn && \
    pip install submodules/diff-gaussian-rasterization && \
    pip install submodules/fused-ssim && \
    cd submodules/mast3r/dust3r/croco/models/curope/ && python setup.py build_ext --inplace