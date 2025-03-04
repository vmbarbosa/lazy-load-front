FROM node:latest as node

ARG ENV=prod
ARG APP=angular-docker

ENV ENV ${ENV}
ENV APP ${APP}

WORKDIR /app
COPY ./ /app/

# Instala y construye el Angular App
RUN mv /home/runner/work/lazy-load-front/lazy-load-front/dist /app/dist/

# Angular app construida, la vamos a hostear un server production, este es Nginx

FROM nginx:1.13.8-alpine

COPY --from=node /app/dist/ /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf