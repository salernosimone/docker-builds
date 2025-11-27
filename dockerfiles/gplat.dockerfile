FROM salernosimone/torch:py311-cu124

RUN micromamba install ninja numpy jaxtyping rich -c conda-forge
RUN TORCH_CUDA_ARCH_LIST="7.5 8.0 8.6 8.9 9.0" pip install --no-build-isolation git+https://github.com/nerfstudio-project/gsplat.git@0b4dddf04cb687367602c01196913cde6a743d70 