FROM rubylang/ruby:3.2.0-dev-jammy
RUN apt update && \
    apt -y upgrade && \ 
    apt -y install libyaml-dev libmysqlclient-dev

RUN gem update && \
    bundle config set path vendor/bundle

WORKDIR /usr/src/app
