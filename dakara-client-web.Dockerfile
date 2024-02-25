FROM --platform=$BUILDPLATFORM node:lts-alpine@sha256:f3299f16246c71ab8b304d6745bb4059fa9283e8d025972e28436a9f9b36ed24 AS builder
WORKDIR /src
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM svenstaro/miniserve:alpine@sha256:4161d9fcf71e63162015cec31d74ebecacf306ba80510ef1d4431ce3868a622b
WORKDIR /app
COPY --from=builder /src/build .
CMD [ "--spa", "--index", "index.html" ]
