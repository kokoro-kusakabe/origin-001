FROM ruby:2.6.5

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    mariadb-client \
    yarn

WORKDIR /origin-001

ADD Gemfile /origin-001/Gemfile
ADD Gemfile.lock /origin-001/Gemfile.lock

RUN gem install bundler
RUN bundle install
