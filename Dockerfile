FROM node:20-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies (skip postinstall bash scripts on Windows)
RUN npm ci --ignore-scripts --legacy-peer-deps

# Copy source code
COPY . .

# Build the project
RUN npm run build

EXPOSE 3060

CMD ["node", "./dist/index.js"]
