FROM node:22.1.0-alpine as build
ENV NODE_ENV production
WORKDIR /app
COPY package*.json ./
RUN npm install --silent
COPY . .
WORKDIR /app/client
RUN npm install --legacy-peer-deps --silent
RUN npm run build
EXPOSE 3000
CMD ["node", "server.js"]