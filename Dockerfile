# It accepts selected Ruby version as an argument.
ARG RUBY_VERSION

FROM ubuntu:latest

RUN if [[ -z "$RUBY_VERSION" ]] ; then echo RUBY_VERSION=2.6.5-alpine ; else echo RUBY_VERSION is $RUBY_VERSION ; fi

FROM ruby:$RUBY_VERSION

RUN apk add --update build-base git

COPY lib /action/lib
COPY README.md LICENSE /

RUN gem install bundler

ENTRYPOINT ["/action/lib/entrypoint.sh"]
