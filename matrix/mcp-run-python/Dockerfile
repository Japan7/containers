# source: https://github.com/pydantic/mcp-run-python/pull/26
FROM python:3.14-slim
COPY --from=ghcr.io/astral-sh/uv:0.9.17 /uv /uvx /bin/
COPY --from=denoland/deno:2.5.6 /usr/bin/deno /usr/bin/deno

# Copy the project into the image
ADD . /app

# Sync the project into a new environment, using the frozen lockfile
WORKDIR /app

# Prepare the python bits
#   'make install' also does something with precommit
RUN uv sync --frozen --compile-bytecode
# or rather 'make build'?
RUN uv run build/build.py

# Prepare the deno bits
WORKDIR /app/mcp_run_python/deno
# no deno task build defined, replaced
RUN deno cache src/main.ts

WORKDIR /app

# Define default executable
ENTRYPOINT ["uv", "run", "mcp-run-python"]

# Advertise default port used in default CMD
EXPOSE 3001

# By default start streamable-http on port 3001
CMD ["--port=3001", "streamable-http"]
