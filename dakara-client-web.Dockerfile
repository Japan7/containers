FROM node:lts-alpine AS builder
WORKDIR /src
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /app
RUN npm install -g serve
COPY --from=builder /src/build .
EXPOSE 3000
ENTRYPOINT [ "serve", "-s", "." ]
