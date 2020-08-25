FROM ruby:2.6

# install package to docker container
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev \
    && apt-get install apt-transport-https \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs mariadb-client \
    && mkdir /FANTRA

WORKDIR /FANTRA
COPY Gemfile /FANTRA/Gemfile
COPY Gemfile.lock /FANTRA/Gemfile.lock

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000