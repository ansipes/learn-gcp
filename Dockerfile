FROM node:15.4 as build
WORKDIR /app
COPY package*.json .
RUN yarn install
COPY . .
RUN yarn run build

FROM nginx:1.19
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist /usr/share/nginx/html

