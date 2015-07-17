class Library::Reader
  attr_accessor :name, :reading_speed

  def initialize name, reading_speed
    @name = name
    @reading_speed = reading_speed
  end

  def self.parse_array arr
    arr.map{|item| self.new *item }
  end

  def prepare_for_csv
    [name, reading_speed]
  end

end
