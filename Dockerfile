FROM node:22.1.0
ENV NODE_ENV production
WORKDIR /usr/src/devconnector
COPY package*.json ./
RUN npm install
COPY . .
RUN cd client && npm install && npm run build
EXPOSE 8080
CMD [ "node", "server.js"]