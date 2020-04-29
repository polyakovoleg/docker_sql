FROM node:12

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app/package.json

RUN npm i

COPY . /app/
