FROM node:20-bookworm
RUN apt update && \
    apt -y upgrade 

RUN npm install -g npm

WORKDIR /usr/src/app

COPY . /usr/src/app
RUN npm install