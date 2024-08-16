FROM node:22.1.0-alpine as build
ENV NODE_ENV production
WORKDIR /app
COPY package*.json ./
RUN npm install --silent
COPY . .
WORKDIR /app/client
RUN npm install --legacy-peer-deps --silent
RUN npm run build

FROM nginx:alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf *
COPY --from=build /app/client/build .

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]