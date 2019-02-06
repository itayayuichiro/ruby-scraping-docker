require 'net/http'
require 'uri'
require 'nokogiri'
require 'kconv'

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
	p div.css('.u-link-no-underline')[0].text
end