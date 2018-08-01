class TranslationsController < ApplicationController
  require 'net/http'
  require 'uri'

  url = URI.parse('https://openapi.naver.com/v1/papago/n2mt')

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  encText = "正在进行翻译功能测试。"
  data = "source='zh-CN'&target=ko&text="+ encText

  client_id = "HEp1IRsDzzO5msQDQoQ0"
  client_secret = "q5qZZEYT3r"

  headers = {
    'X-Naver-Client-Id' => client_id,
    'X-Naver-Clinet_Secret' => client_secret
  }

  resp = http.post(url.path, data, headers)

  puts resp.body
end
