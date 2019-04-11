require 'open-uri'
class HomeController < ApplicationController
  
  def crawler
    for i in 1..853
      pageNum = i
    end

    url =  "https://m.dhlottery.co.kr/gameResult.do?method=byWin&drwNo=" + pageNum.to_s
    doc = Nokogiri::HTML(open(url))

    @values = doc.css('.contents > .bx_lotto_winnum > span')
    @values.each do |v|
      getNum = v.css('.ball').text.strip
      @res = Result.new(winNum: getNum)
      @res.save
    end
    redirect_to '/'
 end

  def index
    @pr = Result.all
    puts "here"
  end

end
