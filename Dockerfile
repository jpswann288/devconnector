FROM node:22.1.0
ENV NODE_ENV production
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --prefix client
EXPOSE 8080
CMD [ "node", "server.js"]