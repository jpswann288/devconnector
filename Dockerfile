FROM node:22.1.0
ENV NODE_ENV production
WORKDIR /usr/src/devconnector
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --prefix client || (echo "Build failed" && exit 1)
EXPOSE 8080
CMD [ "node", "server.js"]