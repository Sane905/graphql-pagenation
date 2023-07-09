# syntax=docker/dockerfile:1
FROM ruby:2.6.8
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /music_communication_app
COPY Gemfile /music_communication_app/Gemfile
COPY Gemfile.lock /music_communication_app/Gemfile.lock
RUN bundle install

# コンテナー起動時に毎回実行されるスクリプトを追加
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# イメージ実行時に起動させる主プロセスを設定
CMD ["rails", "server", "-b", "0.0.0.0"]