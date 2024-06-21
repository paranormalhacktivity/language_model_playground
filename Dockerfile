FROM ruby:3.3.0-alpine3.19

WORKDIR /language_model_playground

COPY . .

RUN gem install bundler \
	bundle check || bundle install
