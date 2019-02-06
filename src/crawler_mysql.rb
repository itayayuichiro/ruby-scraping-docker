require 'net/http'
require 'uri'
require 'nokogiri'
require 'kconv'
require 'active_record'


# DB接続処理
ActiveRecord::Base.establish_connection(
  :adapter  => 'mysql2',
  :database => 'scraping',
  :host     => 'mysql_db',
  :username => 'root',
  :charset => 'utf8mb4',
  :encoding => 'utf8mb4',
  :collation => 'utf8mb4_general_ci',
  :password => 'password'
)

# DBのタイムゾーン設定
# Time.zone_default =  Time.find_zone! 'Tokyo' # config.time_zone
# ActiveRecord::Base.default_timezone = :local # config.active_record.default_timezone

class Article < ActiveRecord::Base; end


uri = URI.parse("https://qiita.com/itaya")
request = Net::HTTP::Get.new(uri)

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

doc = Nokogiri::HTML.parse(response.body.toutf8, nil, 'utf-8')
p '###HTMLタイトル取得###'
p doc.title
p '###記事タイトル取得###'
doc.css('article.ItemLink').each do |div|
	title = div.css('.u-link-no-underline')[0].text
	href = 'https://qiita.com' + div.css('.u-link-no-underline')[0][:href]
	Article.create({title:title,url:href})
end

