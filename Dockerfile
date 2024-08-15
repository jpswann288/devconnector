FROM node:22.1.0 as build
ENV NODE_ENV production
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN cd client && npm install --legacy-peer-deps && npm run build

FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build usr/src/app/build /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]