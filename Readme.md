# 概要
rubyでスクレイピングをする人用のスターターキットDocker

## 構築環境
* ruby
* MySQL

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

* crawler_mysql.rb

rubyで取った値をmysqlのDBに格納する方法を記述(qiitaの記事タイトルとURLを格納する)

ホスト側からSequel Proなどで確認する場合の設定
```
ホスト：127.0.0.1
ユーザー名：root
パスワード：password
ポート：3307
```

* crawler_selenium.rb

上記の手順をHeadless Chromeを使って実装してたもの。