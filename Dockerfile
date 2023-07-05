# It accepts selected Ruby version as an argument.
ARG RUBY_VERSION=3.2.1
ENV ENV_RUBY=$RUBY_VERSION

RUN echo "The ruby-version is: $ENV_RUBY"

FROM ruby:$ENV_RUBY-alpine

RUN apk add --update build-base git

COPY lib /action/lib
COPY README.md LICENSE /

RUN gem install bundler

ENTRYPOINT ["/action/lib/entrypoint.sh"]
