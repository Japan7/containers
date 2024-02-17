FROM --platform=$BUILDPLATFORM node:lts-alpine AS builder
WORKDIR /src
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM svenstaro/miniserve:alpine
WORKDIR /app
COPY --from=builder /src/build .
CMD [ "/app" ]
