FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn


ARG GIT_PERSONAL_ACCESS_TOKEN
ARG BUNDLE_GEMS__CONTRIBSYS__COM
ENV APP_ROOT /app
ENV BUNDLE_PATH	/usr/local/bundle

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT
VOLUME $APP_ROOT/log
COPY Gemfile /$APP_ROOT/Gemfile
# COPY Gemfile.lock /$APP_ROOT/Gemfile.lock
COPY . /$APP_ROOT

RUN bundle install

RUN mkdir /tmp/ssm
RUN curl https://s3.ap-northeast-1.amazonaws.com/amazon-ssm-ap-northeast-1/latest/debian_amd64/amazon-ssm-agent.deb -o /tmp/amazon-ssm-agent.deb \
    && dpkg -i /tmp/amazon-ssm-agent.deb \
    && cp /etc/amazon/ssm/seelog.xml.template /etc/amazon/ssm/seelog.xml

# Start the main process.

# CMD ["rails", "server", "-b", "0.0.0.0"]
