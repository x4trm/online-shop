FROM ruby:3.2.2

RUN apt-get update -y && apt-get install -y \
  nodejs \
  yarn \
  sqlite3 \
  libsqlite3-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -m user

WORKDIR /my_app

COPY Gemfile* ./

USER user
RUN bundle install

USER root
COPY . .
RUN chown -R user:user /my_app

USER user

CMD ["rails", "server", "-b", "0.0.0.0"]