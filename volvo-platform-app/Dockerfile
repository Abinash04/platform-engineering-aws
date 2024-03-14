FROM node:lts-alpine as build

WORKDIR /volvo-platform-app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:lts-alpine
COPY --from=build /volvo-platform-app/build /usr/share/nginx/html

EXPOSE 80

# Run the nginx in foreground
CMD ["nginx", "-g", "daemon off;"]