# FROM ruby:2.6.3

# RUN apt-get update -qq && \
#     apt-get install -y build-essential \
#                         libpq-dev \
#                         nodejs

# RUN mkdir /app_name

# ENV APP_ROOT /app_name
# WORKDIR $APP_ROOT

# ADD ./Gemfile $APP_ROOT/Gemfile
# ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# ADD . $APP_ROOT

FROM ruby:3.0.4
RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs
RUN npm install --global yarn
WORKDIR /samplerails
COPY Gemfile Gemfile.lock /samplerails/
RUN bundle install
CMD ["rails", "server", "-b", "0.0.0.0"]