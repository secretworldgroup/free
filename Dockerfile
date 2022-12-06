FROM node:16 AS frontend

WORKDIR /frontend
COPY package*.json /frontend/
RUN npm install

COPY . /frontend
RUN npm run dev

FROM nginx:1.23.2
COPY --from=frontend /frontend/dist/ /usr/share/nginx/html
