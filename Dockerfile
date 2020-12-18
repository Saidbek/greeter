FROM ruby:2.6.4

RUN apt-get update -qq && apt-get install -y build-essential

RUN gem install bundler -v 2.1.4

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

RUN bundle config set without 'development test' \
	&& bundle install

ADD . $APP_HOME

EXPOSE 3000

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "3000"]