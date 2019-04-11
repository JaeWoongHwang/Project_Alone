require 'open-uri'

class AppsController < ApplicationController
  def index
    @ranking=[]

    doc = Nokogiri::HTML(open("https://www.naver.com"))

    doc.css(".ah_roll .ah_roll_area ul li").each do |element|
      @ranking <<{
        rank: element.css("span.ah_r").text,
        keyword: element.css("span.ah_k").text
      }
    end
  end

  def crawler
    for i in 1..853
        pageNum = i
    end

    url = "https://m.dhlottery.co.kr/gameResult.do?method=byWin&drwNo=" + pageNum.to_s
  
    doc = Nokogiri::HTML(open(url))
    @values = doc.css('.contents > .bx_lotto_winnum > span')
    @values.each do |v|
      getNum = v.css('.ball').text.strip
      @res = App.new(winNum: getNum)
      @res.save
    end
  end
  
  def show
    @app = App.all
  end
end
