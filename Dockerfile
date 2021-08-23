# ruby base image
FROM ruby:2.5-stretch as ruby-base

LABEL Name=chattie Version=0.0.1

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - 
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  nodejs \
  postgresql-client \
  yarn

ENV APP_HOME=/app
WORKDIR ${APP_HOME}

COPY Gemfile* package.json ./
RUN gem install bundler -v 2.0.1

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b". "0.0.0.0"]

