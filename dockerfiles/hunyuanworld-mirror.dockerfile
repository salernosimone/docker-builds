FROM salernosimone/torch:py311-cu124

RUN git clone https://github.com/Tencent-Hunyuan/HunyuanWorld-Mirror.git && \
    cd HunyuanWorld-Mirror && \
    TORCH_CUDA_ARCH_LIST="7.5 8.0 8.6 8.9 9.0" pip install git+https://github.com/nerfstudio-project/gsplat.git && \
    TORCH_CUDA_ARCH_LIST="7.5 8.0 8.6 8.9 9.0" pip install -r requirements.txt
RUN micromamba install -y "huggingface_hub[cli]" && hf download tencent/HunyuanWorld-Mirror --local-dir /HunyuanWorld-Mirror/ckpts
RUN apt update && apt install -y libgl1 libglib2.0-0 ffmpeg && rm -rf /var/lib/apt/lists/*
RUN sed -i 's|tencent/HunyuanWorld-Mirror|ckpts|g' /HunyuanWorld-Mirror/infer.py