FROM --platform=$BUILDPLATFORM node:lts-alpine@sha256:c0a3badbd8a0a760de903e00cedbca94588e609299820557e72cba2a53dbaa2c AS builder
WORKDIR /src
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM svenstaro/miniserve:alpine@sha256:2ad8149c6c4961d9f3872ed8cb898faa95d9e1f1651008bd9ddc5b3b51dbd50f
WORKDIR /app
COPY --from=builder /src/build .
CMD [ "--spa", "--index", "index.html" ]
