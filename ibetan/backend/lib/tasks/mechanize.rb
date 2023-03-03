#ルートを指定後このファイルの実行ができる
#$ ruby mechanize.rb
require 'mechanize'

url_0 = "https://www.city.suita.osaka.jp/kurashi/1018573/1018587/index.html"
agent = Mechanize.new
page = agent.get(url_0)

newsList = page.search('//ul/li/span[@class="newsli"]')

newsList.each do | a |
    title = a.inner_text
    url = a.get_attribute('href')
    puts "#{ title }:#{ url }"
end