FROM salernosimone/micromamba:py311-cu124

RUN micromamba install -y ninja cmake=3.14.0 pytorch=2.4.1 torchvision pytorch-cuda=12.4 -c pytorch -c nvidia -c conda-forge && \
    micromamba clean --all --yes