# It accepts selected Ruby version as an argument.
ARG RUBY_VERSION

FROM ruby:3.2.1-slim

RUN apk add --update build-base git

COPY lib /action/lib
COPY README.md LICENSE /

RUN gem install bundler

ENTRYPOINT ["/action/lib/entrypoint.sh"]
