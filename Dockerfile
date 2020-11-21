FROM ruby:2.5.8
RUN apk add --update --no-cache \
  binutils-gold \
  build-base \
  curl \
  file \
  g++ \
  gcc \
  git \
  less \
  libstdc++ \
  libffi-dev \
  libc-dev \
  linux-headers \
  libxml2-dev \
  libxslt-dev \
  libgcrypt-dev \
  make \
  netcat-openbsd \
  nodejs \
  openssl \
  python2 \
  pkgconfig \
  postgresql-dev \
  tzdata \
  yarn


RUN gem install bundler -v 2.1.4


RUN mkdir /car-to-you
WORKDIR /car-to-you
COPY . /car-to-you

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

RUN yarn install --check-files


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
