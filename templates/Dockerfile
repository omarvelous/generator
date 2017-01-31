FROM ruby:2.3.1-alpine

RUN apk add --update --no-cache \
      build-base \
      nodejs \
      tzdata \
      libxml2-dev \
      libxslt-dev \
      imagemagick \
      postgresql-dev
RUN bundle config build.nokogiri --use-system-libraries

ADD . /app
WORKDIR /app
