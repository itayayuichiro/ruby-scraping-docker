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
* qiita.rb

qiitaのトレンドの
* タイトル
* いいね数

を取得するスクリプト