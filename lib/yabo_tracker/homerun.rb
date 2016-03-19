require_relative "./helpers"

class Homerun
  attr_reader :true_distance, :horizontal_angle

  def initialize(homerun_nokogiri_row)
    @true_distance    = homerun_nokogiri_row.search('td:nth-of-type(19) span').text.to_i
    @horizontal_angle = homerun_nokogiri_row.search('td:nth-of-type(14) span').text.to_f
  end
end