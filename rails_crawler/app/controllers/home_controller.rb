require 'open-uri'
class HomeController < ApplicationController
  
  def crawler
    @number = []
    @round = []
    doc = Nokogiri::HTML(open("https://m.dhlottery.co.kr/gameResult.do?method=byWin&drwNo=853"))
    @round << {info:doc.css(".contents .wrap_select #dwrNoList option[type=selected]").text}

    doc.css(".contents .bx_lotto_winnum").each do |element|
      @number << {
        num1:element.css('span:nth-child(1)').text,
        num2:element.css('span:nth-child(2)').text,
        num3:element.css('span:nth-child(3)').text,
        num4:element.css('span:nth-child(4)').text,
        num5:element.css('span:nth-child(5)').text,
        num6:element.css('span:nth-child(6)').text,
        bonusNum:element.css('span:nth-child(8)').text
      }
    end

    @number.split('')
  end

  def index
  end

end
