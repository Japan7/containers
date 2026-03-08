FROM --platform=$BUILDPLATFORM docker.io/node:lts-alpine AS builder
WORKDIR /src
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM docker.io/caddy:2.11.2-alpine
COPY --from=builder /src/dist /srv
COPY <<EOF /etc/caddy/Caddyfile
{
    admin off
}
:8080 {
    root * /srv
    try_files {path} /static/index.html
    file_server
    log
}
EOF
EXPOSE 8080
