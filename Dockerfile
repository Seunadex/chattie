# ruby base image
FROM ruby:2.6.9 as ruby-base

LABEL Name=chattie Version=0.0.1

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  nodejs \
  postgresql-client \
  yarn

# rails-dev
FROM ruby-base as rails-dev

WORKDIR /app 

COPY Gemfile* package.json ./
RUN gem install bundler -v 2.0.1

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b". "0.0.0.0"]

