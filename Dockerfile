# Multi-stage build: build with Node, serve with nginx  
# Updated 2025-10-30 to fix React module resolution
FROM node:20.18.0-slim AS base
WORKDIR /app

FROM base AS build

# Install build tools and yarn
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential node-gyp pkg-config python-is-python3 yarn && \
    rm -rf /var/lib/apt/lists/*

# Copy package files for installation
COPY package.json ./
COPY yarn.lock ./

# Install dependencies with yarn (avoids npm bug in Docker)
RUN yarn install --frozen-lockfile || yarn install

# Copy vite configuration first to ensure no cache issues
COPY vite.config.ts ./
COPY tsconfig.json ./
COPY index.html ./

# Copy rest of the source
COPY . .

# Verify vite.config.ts is correct (no ./ alias)
RUN grep -q "figma:asset" vite.config.ts || (echo "ERROR: vite.config.ts missing figma:asset alias!" && exit 1)
RUN ! grep -q '"\./":' vite.config.ts || (echo "ERROR: vite.config.ts has bad ./ alias!" && exit 1)

# Build Vite app
RUN yarn build

# Final stage: serve with nginx
FROM nginx:latest AS runner
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
