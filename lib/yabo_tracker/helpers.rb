require "net/http"
require "nokogiri"

module Helpers
  BASE_URL = "http://www.hittrackeronline.com/detail.php"

  def self.build_base_url(id, type = "ballpark")
    BASE_URL + "?id=#{id}&type=#{type}"
  end

  def self.generate_nokogiri_html(url)
    Nokogiri::HTML(Net::HTTP.get(URI(url)))
  end
end