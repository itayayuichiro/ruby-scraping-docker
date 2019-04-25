require 'net/http'
require 'uri'
require 'nokogiri'
require 'kconv'
require 'json'
require 'pp'

uri = URI.parse("https://qiita.com/")
request = Net::HTTP::Get.new(uri)

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

doc = Nokogiri::HTML.parse(response.body.toutf8, nil, 'utf-8')
json_data = JSON.parse(doc.css('.p-home_main div')[0].attribute("data-hyperapp-props").value)
result = []
json_data['trend']['edges'].each do |record|
  result.push({
    :title => record['node']['title'],
    :likesCount => record['node']['likesCount'],
  })
end
pp result
