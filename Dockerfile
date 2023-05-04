FROM node:14-alpine as buidlder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=buidlder /app/build /usr/share/nginx/html

