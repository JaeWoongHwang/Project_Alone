require 'open-uri'

class AppsController < ApplicationController
  def index
    @data = App.all
  end

  def crawler
    (2).downto(1) do |c|
        pageNum = "c"
    end

    url = "https://m.dhlottery.co.kr/gameResult.do?method=byWin&drwNo="
    doc = Nokogiri::HTML(open(url))
    @values = doc.css('.bx_lotto_winnum')
    @values.each do |x|
      getNum = x.css('.ball').text.strip
      @res = App.new(winNum:getNum)
      @res.save
    end
    redirect_to '/'
  end
  
end
