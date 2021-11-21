FROM node:alpine as builder
WORKDIR "/app"
COPY package.json .
RUN npm i -g npm@8.1.3
RUN npm install
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html