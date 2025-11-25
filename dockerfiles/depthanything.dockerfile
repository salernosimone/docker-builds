FROM salernosimone/micromamba:py310-cu124

RUN apt update && \
    git clone https://github.com/ByteDance-Seed/Depth-Anything-3 && \
    cd Depth-Anything-3 && pip install -q -e ".[gs]"

WORKDIR Depth-Anything-3
RUN hf download depth-anything/DA3NESTED-GIANT-LARGE --local-dir checkpoints