FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu raring main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y openssh-server git-core openssh-client curl
RUN apt-get install -y build-essential


RUN apt-get install -y openssl libreadline6 libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config postgresql-dev yarn

RUN \curl -L https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.5.8"
RUN /bin/bash -l -c "gem install bundler -v 2.1.4 --no-ri --no-rdoc"

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
