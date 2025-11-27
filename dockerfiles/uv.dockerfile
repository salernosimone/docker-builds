FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04

RUN apt update && apt install -y curl && curl -LsSf https://astral.sh/uv/install.sh | sh