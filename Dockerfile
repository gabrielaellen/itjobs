
FROM ruby:3.2.2

WORKDIR /app

COPY . .

RUN bundle install

RUN apt-get update && apt-get install -y nodejs

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]