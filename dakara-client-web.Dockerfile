FROM --platform=$BUILDPLATFORM node:lts-alpine AS builder
WORKDIR /src
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM docker.io/svenstaro/miniserve:0.29.0-alpine
WORKDIR /app
COPY --from=builder /src/dist/static .
CMD [ "--spa", "--index", "index.html" ]
EXPOSE 8080
