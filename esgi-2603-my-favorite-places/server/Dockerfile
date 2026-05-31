# Stage 1: Build TypeScript
FROM node:22-alpine AS builder

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install

COPY src ./src
COPY tsconfig.json ./tsconfig.json

RUN yarn build

# Stage 2: Production (sans devDependencies ni sources TS)
FROM node:22-alpine

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install --production

COPY --from=builder /app/dist ./dist

EXPOSE 3000

CMD ["node", "dist/index.js"]
