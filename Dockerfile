FROM ruby:2.4

RUN apt-get update -qq && apt-get install -y build-essential apt-transport-https apt-utils

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for a JS runtime
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# for yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn

WORKDIR /app
ADD .gemrc /app
ADD Gemfile /app/
ADD Gemfile.lock /app/

ENV RAILS_ENV=development
ENV NODE_ENV=development

# Modify bundle config to use local gem cache and then do bundle install
RUN bundle install --jobs 8

ADD package.json /app/

RUN yarn install

ADD . /app

RUN rake db:create && rake db:migrate
EXPOSE 3000
CMD ["bundle", "exec", "rails", "s"]
