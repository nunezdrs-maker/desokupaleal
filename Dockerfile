# Multi-stage build: build with Node, serve with nginx
FROM node:20.18.0-slim AS build
WORKDIR /app

# Install build tools and yarn
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential node-gyp pkg-config python-is-python3 yarn && \
    rm -rf /var/lib/apt/lists/*

# Copy package files for installation
COPY package*.json yarn.lock* ./

# Install dependencies with yarn (more reliable than npm in Docker)
RUN yarn install --frozen-lockfile || yarn install

# Copy rest of the source
COPY . .

# Build Vite app
RUN yarn build

# Final stage: serve with nginx
FROM nginx:latest AS runner
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
