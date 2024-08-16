FROM node:22.1.0-alpine as build
ENV NODE_ENV production
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --silent
COPY . .
RUN cd client && npm install -g --legacy-peer-deps --silent && npm run build

FROM nginx:alpine
COPY --from=build /usr/src/app/client/build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY /usr/src/app/nginx/nginx.conf /etc/nginx/conf.d

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]