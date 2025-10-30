# Multi-stage build: build with Node, serve with nginx
FROM node:20.18.0-slim AS build
WORKDIR /app

# Copy package.json and package-lock.json (if present) for deterministic install
COPY package*.json ./

# Deterministic install using lockfile if present
RUN npm ci --include=dev

# Copy rest of the source
COPY . .

# Install build tools if needed
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential node-gyp pkg-config python-is-python3 && \
    rm -rf /var/lib/apt/lists/*

# Build Vite app
RUN npm run build

# Final stage: serve with nginx
FROM nginx:latest AS runner
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
