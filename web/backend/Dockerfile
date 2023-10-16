FROM rubylang/ruby:3.2.0-dev-jammy
RUN apt update && \
    apt -y upgrade && \ 
    apt -y install vim imagemagick libyaml-dev libmysqlclient-dev 

# 「.」は「source」と同じ意味
RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv && \
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

ENV PATH /root/.rbenv/shims:/root/.rbenv/bin:/usr/local/sbin::$PATH

# 公式で3.2.2がないのでとりあえず3.2.2を入れます
# あとマネクラも3.2.2なので
RUN rbenv install 3.2.2 && \
    rbenv global 3.2.2

RUN gem update && \
    bundle config set path vendor/bundle


WORKDIR /usr/src/app
