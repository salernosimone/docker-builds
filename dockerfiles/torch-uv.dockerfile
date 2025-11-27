FROM salernosimone/uv:cu124

ENV VIRTUAL_ENV=/app/.venv
ENV PATH="/app/.venv/bin:$PATH"
WORKDIR /
RUN uv init app --python 3.10 && cd app && uv add "torch==2.4.0" torchvision