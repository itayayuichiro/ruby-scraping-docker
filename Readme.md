# Overview
Starter kit for people who scraping with ruby ​​Docker

## Construction environment
* ruby
* MySQL

## Execution procedure
1. Copy this repository to clone
1. `docker-compose build`
1. `docker-compose up -d`
1. `docker-compose exec play bash`
1. `bundle install --path .bundle`
1. `bundle exec ruby **.rb`

## Initial set code
* crawler.rb

Scraping using net / http communication and HTML parser Nokogiri which is the first step in ruby's http communication (scraping of qiita my page of developer itaya)

* crawler_mysql.rb

Describe a method to store the value taken by ruby ​​in DB of mysql (store qiita's article title and URL)

table
```
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```
Setting when checking with Sequel Pro etc. from the host side

```
Host: 127.0.0.1
User name: root
Password: password
Port: 3307
```

* crawler_selenium.rb

The above procedure was implemented using Headless Chrome.
