FROM ruby:3.1.2-alpine

RUN apk -U add build-base postgresql-dev tzdata curl curl-dev git

ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=true
ENV APP_DIR=/app

WORKDIR ${APP_DIR}

COPY Gemfile Gemfile.lock ./

ARG GITLAB_AUTH_TOKEN
RUN bundle config --local GITLAB__COM gitlab-ci-token:${GITLAB_AUTH_TOKEN}

RUN bundle install

COPY . ${APP_DIR}

RUN ln -s /lib/libc.musl-x86_64.so.1 /lib/ld-linux-x86-64.so.2

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 1234 3000 26162

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
