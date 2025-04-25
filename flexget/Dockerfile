FROM docker.io/python:3.12-alpine AS builder
ENV PYTHONUNBUFFERED=1

RUN --mount=type=cache,target=/var/cache/apk \
  apk add --upgrade \
  ca-certificates \
  nodejs \
  build-base \
  libffi-dev \
  openssl-dev \
  unzip

COPY --from=ghcr.io/astral-sh/uv:0.6 /uv /uvx /bin/
ENV UV_COMPILE_BYTECODE=1 UV_LINK_MODE=copy

ADD https://github.com/Flexget/Flexget.git#develop /flexget
WORKDIR /flexget

RUN --mount=type=cache,target=/root/.cache/uv \
  uv run scripts/bundle_webui.py
RUN --mount=type=cache,target=/root/.cache/uv \
  uv sync --frozen --no-dev --all-groups --all-extras --no-install-project
RUN --mount=type=cache,target=/root/.cache/uv \
  uv sync --frozen --no-dev --all-groups --all-extras

FROM docker.io/python:3.12-alpine
ENV PYTHONUNBUFFERED=1

RUN --mount=type=cache,target=/var/cache/apk \
  apk add --upgrade \
  ca-certificates \
  nodejs \
  tzdata

# Copy the application from the builder
COPY --from=builder /flexget /flexget

# Place executables in the environment at the front of the path
ENV PATH="/flexget/.venv/bin:$PATH"

VOLUME /config
WORKDIR /config

ENTRYPOINT ["flexget"]
