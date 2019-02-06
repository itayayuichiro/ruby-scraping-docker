# 概要
rubyでスクレイピングをする人用のスターターキットDocker

## 実行手順
1. このリポジトリをclone
1. `docker-compose build`
1. `docker-compose up -d`
1. `docker-compose exec play bash`
1. `bundle install --path .bundle`
1. `bundle exec ruby ソース名.rb`

## 初期セットしてあるコード
* crawler.rb
rubyのhttp通信を行う上で一番初歩の初歩であるnet/http通信とHTMLのパーサーであるNokogiriを用いたスクレイピング(開発者であるitayaのqiitaマイページのスクレイピング)
* crawler_open_url.rb
net/httpより