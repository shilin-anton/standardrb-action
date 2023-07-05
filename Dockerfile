# It accepts selected Ruby version as an argument.
ARG RUBY_VERSION=2.6.5-alpine

FROM ubuntu:latest

RUN echo "The ruby-version is: $RUBY_VERSION"

FROM ruby:$RUBY_VERSION

RUN apk add --update build-base git

COPY lib /action/lib
COPY README.md LICENSE /

RUN gem install bundler

ENTRYPOINT ["/action/lib/entrypoint.sh"]
