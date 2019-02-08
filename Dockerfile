FROM node:alpine as builder

WORKDIR '/app'

copy package.json .
run npm install
copy . .
run npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html