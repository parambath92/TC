FROM ruby:2.7
MAINTAINER rajguruparambath@gmail.com
RUN gem install rails -v 6.0.2.2 && gem install sqlite3 && gem install bundler
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn
RUN rails new blog
WORKDIR blog
RUN bundle add cequel && bundle add activemodel-serializers-xml
RUN rails g scaffold post title body
COPY routes.rb config/routes.rb 
COPY post.rb app/models/post.rb
COPY cequel.yml config/cequel.yml
RUN rails g cequel:configuration
COPY cequel.yml config/cequel.yml
EXPOSE 3000
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["bash", "entrypoint.sh"]
