FROM node:13.12.0-alpine AS development

WORKDIR /usr/src/safu-app

COPY package*.json ./

RUN npm install && npm install react-scripts@3.4.1 -g --silent

COPY . ./

RUN npm run build

FROM nginx:latest
COPY --from=development /usr/src/safu-app/build /usr/share/nginx/html