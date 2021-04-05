FROM node:14 as build
WORKDIR /app
COPY . /app
RUN npm install -f && npm run build

FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html