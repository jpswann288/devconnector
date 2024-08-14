FROM node:22.1.0
WORKDIR /devconnector
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 80
CMD ["npm", "run", "prod"]
