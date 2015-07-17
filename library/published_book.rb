class Library::PublishedBook < Library::Book

  include Library::Identifier
  attr_accessor :price, :pages_quantity, :published_at

  def initialize title, price, pages_quantity, published_at, *author
    @price = price
    @pages_quantity = pages_quantity
    @published_at = published_at
    super title, *author
  end

  def self.parse_array arr
    arr.map{|item| self.new *item }
  end

  def prepare_for_csv
    [title, price, pages_quantity, published_at, author.prepare_for_csv].flatten
  end

  def age
    Time.now.year - published_at
  end

  def penalty_per_hour
    price_penalty = price * 0.0005
    pages_penalty = 0.000003 * price * pages_quantity
    age_penalty = 0.00007 * price * age

    price_penalty + pages_penalty + age_penalty
  end

end
