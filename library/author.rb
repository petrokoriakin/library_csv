class Library::Author
  
  include Library::Commentable

  attr_accessor :year_of_birth, :year_of_death, :name

  def initialize year_of_birth, year_of_death, name
    @year_of_birth = year_of_birth
    @year_of_death = year_of_death
    @name = name
  end

  def prepare_for_csv
    [year_of_birth, year_of_death, name]
  end
  
end
