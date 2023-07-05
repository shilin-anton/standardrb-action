# It accepts selected Ruby version as an argument.
ARG RUBY_VERSION=2.6.5-alpine

ENV ENV_RUBY=$RUBY_VERSION

FROM ubuntu:latest

RUN echo "The ruby-version is: $ENV_RUBY"

FROM ruby:$ENV_RUBY

RUN apk add --update build-base git

COPY lib /action/lib
COPY README.md LICENSE /

RUN gem install bundler

ENTRYPOINT ["/action/lib/entrypoint.sh"]
