FROM node:22.1.0
WORKDIR /devconnector
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8080
CMD ["npm", "run", "prod"]
