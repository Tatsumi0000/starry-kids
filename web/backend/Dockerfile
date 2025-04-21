FROM rubylang/ruby:3.2.0-dev-jammy
RUN apt update && \
    apt -y upgrade && \ 
    apt -y install vim imagemagick libyaml-dev libmysqlclient-dev 

# 「.」は「source」と同じ意味
RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv && \
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

ENV PATH /root/.rbenv/shims:/root/.rbenv/bin:/usr/local/sbin::$PATH

# 3.3.0のイメージにdevがないのでrbenvで入れます
RUN rbenv install 3.3.0 && \
    rbenv global 3.3.0

RUN gem update && \
    bundle config set path vendor/bundle

WORKDIR /usr/src/app
COPY . /usr/src/app
RUN bundle install