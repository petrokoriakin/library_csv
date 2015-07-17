class Library::Book

  include Library::Commentable

  attr_accessor :author, :title

  def initialize title, *author_attributes
    @author = if author_attributes.size == 1 
      author_attributes[0]
    else
      Library::Author.new(*author_attributes)
    end
    @title = title
  end

end
