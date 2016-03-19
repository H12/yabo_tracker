require "net/http"
require "nokogiri"
require_relative "helpers"

class Ballpark
  attr_reader :homeruns, :name

  include Helpers

  def initialize(name_fragment, year=2015)
    url = "http://www.hittrackeronline.com/stadiums.php"
    html = Helpers.generate_nokogiri_html(url)
    links = html.css("table.forumline tr td:nth-of-type(2) a")
    name = nil
    case year
    when 2015
      id = nil
      match_counter = 0
      links.each do |link|
        if link.text.downcase.include? name_fragment.downcase
          match_counter += 1
          href = link['href']
          id = href[/id=([^&]*)/].gsub('id=', '')
          name = link.text
        end
      end
      raise "No ballpark by that name!" if id.nil?
      raise "Multiple matching ballparks, be more specific!" if match_counter > 1
    else
      raise "No data for that year"
    end
    @name = name
    @homeruns = Homerun.homers_for_id(id)
  end
end