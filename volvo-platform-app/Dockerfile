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

aws ecr get-login-password --region us-east-1 | docker login -p --username AWS --password-stdin 471112730019.dkr.ecr.us-east-1.amazonaws.com