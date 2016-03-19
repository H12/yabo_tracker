require "net/http"
require "nokogiri"
require_relative "helpers"

class Homerun
  attr_reader :true_distance, :horizontal_angle

  include Helpers

  def initialize(homerun_nokogiri_row)
    @horizontal_angle = homerun_nokogiri_row.search('td:nth-of-type(14) span').text.to_f
    @true_distance    = homerun_nokogiri_row.search('td:nth-of-type(19) span').text.to_i
  end

  def self.homers_for_id(id)
    html = Helpers.generate_nokogiri_html(Helpers.build_base_url(id))
    rows = html.search('table.forumline:last-of-type tr')[4..-1]
    rows.map do |row|
      Homerun.new(row)
    end
  end
end