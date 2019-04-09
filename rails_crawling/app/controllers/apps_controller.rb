require 'open-uri'

class AppsController < ApplicationController
  def index
    @data = App.all
  end

  def crawler
    for i in 1..853
        pageNum = i
    end

    url = "https://m.dhlottery.co.kr/gameResult.do?method=byWin&drwNo=" + pageNum
  
    doc = Nokogiri::HTML(open(url))
    @values = doc.css('.contents > .bx_lotto_winnum > span')
    @values.each do |v|
      getNum = v.css('.ball').text.strip
      @res = App.new(winNum:getNum)
      @res.save
    end
    redirect_to '/'
  end
  
end
