FROM salernosimone/uv:cu124

ENV VIRTUAL_ENV=/app/.venv
ENV PATH="/app/.venv/bin:$PATH"
WORKDIR /

RUN apt update && \
    apt install -y git ninja-build libgl1 libglib2.0-0 ffmpeg && rm -rf /var/lib/apt/lists/* && \
    uv init app --python 3.10 && \
    cd app && \
    uv add ninja && \
    git clone https://github.com/ByteDance-Seed/Depth-Anything-3 && \
    cd Depth-Anything-3 && \
    uv pip install -r requirements.txt && \
    uv pip install jaxtyping rich ninja "moviepy==1.0.3" && \
    uv pip install gsplat --index-url https://docs.gsplat.studio/whl/pt24cu124
ENV PYTHONPATH="/app/Depth-Anything-3/src:$PYTHONPATH"
WORKDIR /app/Depth-Anything-3
#RUN hf download depth-anything/DA3-GIANT --local-dir /app/Depth-Anything-3/checkpoints/DA3-GIANT
