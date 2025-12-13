FROM --platform=$BUILDPLATFORM node:lts-alpine AS builder
WORKDIR /src
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM docker.io/svenstaro/miniserve:0.32.0-alpine
WORKDIR /app
COPY --from=builder /src/dist .

# check that index file is at the expected location
RUN ls static/index.html

CMD [ "--spa", "--index", "static/index.html" ]
EXPOSE 8080
