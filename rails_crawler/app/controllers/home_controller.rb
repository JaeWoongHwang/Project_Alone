require 'open-uri'
class HomeController < ApplicationController
  
  def crawler
    @number = []

    doc = Nokogiri::HTML(open("https://m.dhlottery.co.kr/gameResult.do?method=byWin&drwNo=853"))
    doc.css(".contents .bx_lotto_winnum").each do |element|
      @number << {
        num:element.children("span:not('.plus')").text

      }
    end
  end

  def index
  end

end
