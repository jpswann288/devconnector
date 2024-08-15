FROM node:22.1.0
ENV NODE_ENV production
WORKDIR /website
COPY package*.json ./
RUN npm install
COPY . .
RUN cd client && npm install --legacy-peer-deps && npm run build
EXPOSE 3000
CMD [ "node", "server.js"]