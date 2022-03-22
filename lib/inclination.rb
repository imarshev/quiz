require "httpx"

module Inclination
  module_function

  def incline(word, number)
    REXML::Document.new(HTTPX.get("https://ws3.morpher.ru/russian/spell?n=#{number}&unit=#{word}")).root[1][0].get_text
  end
end
