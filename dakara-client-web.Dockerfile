FROM --platform=$BUILDPLATFORM node:lts-alpine@sha256:c0a3badbd8a0a760de903e00cedbca94588e609299820557e72cba2a53dbaa2c AS builder
WORKDIR /src
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM svenstaro/miniserve:alpine@sha256:4161d9fcf71e63162015cec31d74ebecacf306ba80510ef1d4431ce3868a622b
WORKDIR /app
COPY --from=builder /src/build .
CMD [ "--spa", "--index", "index.html" ]
