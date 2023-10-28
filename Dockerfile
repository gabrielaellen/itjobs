
FROM ruby:3.2.2

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

WORKDIR /app

COPY . .

RUN bundle install
RUN yarn install --check-files

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
