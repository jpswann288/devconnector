# Stage 1: Build the React app
FROM node:22.1.0 as build

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (or yarn.lock)
COPY client/package*.json ./client/
RUN cd client && npm install --legacy-peer-deps

# Copy application source code
COPY client /usr/src/app/client/

# Build the React app
RUN cd client && npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy built React app to Nginx's default directory
COPY --from=build /usr/src/app/client/build /usr/share/nginx/html

# Copy custom Nginx configuration if needed
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
