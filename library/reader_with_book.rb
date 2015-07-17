class Library::ReaderWithBook

  include Library::Identifier
  attr_accessor :amazing_book, :current_page, :reader, :return_date

  def initialize  amazing_book, reader, current_page = 0, return_date = (Time.now + 2.weeks)
    @amazing_book = amazing_book
    @reader = reader
    @return_date = return_date
    @current_page = current_page
  end

  def self.parse_array arr
    # arr => [published_book_identifier, reader_identifier, current_page, return_date
    arr.map do |item| self.new *item 
    
    end
  end

  def prepare_for_csv
    []
  end

  def time_to_finish
    ((amazing_book.pages_quantity - current_page) / reader.reading_speed).round(2)
  end

  def penalty
    amazing_book.penalty_per_hour * hours_overdue
  end

  def hours_overdue
    (Time.now.to_i - return_date.to_time.to_i) / 3600.0
  end

  def hours_remaining
    - hours_overdue.round(2)
  end

  def days_to_buy

  end

  def read_the_book! duration

  end

  def penalty_to_finish

  end

end
