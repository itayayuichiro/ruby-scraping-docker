require 'net/http'
require 'uri'
require 'nokogiri'
require 'kconv'
require 'active_record'
require 'selenium-webdriver'


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


ua = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36"
#ヘッドレスモード
caps = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {args: ["--headless","--no-sandbox", "--disable-setuid-sandbox", "--disable-gpu", "--user-agent=#{ua}", 'window-size=1280x800']})

driver = Selenium::WebDriver.for :chrome, desired_capabilities: caps

driver.navigate.to "https://qiita.com/itaya"
html = driver.page_source
driver.quit

doc = Nokogiri::HTML.parse(html.toutf8, nil, 'utf-8')
p '###HTMLタイトル取得###'
p doc.title
p '###記事タイトル取得###'
doc.css('article.ItemLink').each do |div|
	title = div.css('.u-link-no-underline')[0].text
	href = 'https://qiita.com' + div.css('.u-link-no-underline')[0][:href]
	Article.create({title:title,url:href})
end

