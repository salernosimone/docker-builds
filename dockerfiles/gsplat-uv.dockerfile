FROM salernosimone/torch:uv-py310-cu124

WORKDIR /app
RUN uv add numpy jaxtyping rich ninja
RUN apt update && apt install -y ninja-build && uv pip install gsplat --index-url https://docs.gsplat.studio/whl/pt24cu124