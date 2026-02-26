# syntax=docker/dockerfile:1

FROM ruby:3.3-slim

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /rails

# Copy Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ && \
    rm -rf /usr/local/bundle/cache/*.gem

# Copy application code
COPY . .

# Precompile bootsnap
RUN bundle exec bootsnap precompile --gemfile app/ lib/

# Precompile assets
RUN SECRET_KEY_BASE=DUMMY ./bin/rails assets:precompile

EXPOSE 3000

CMD ["./bin/rails", "server"]