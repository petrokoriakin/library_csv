module Library

  class Dump
    
    def initialize manager
      @manager = manager
    end 

    def load_from_dump
      manager.load_readers CSV.read("dumps/readers.csv")
      manager.load_books CSV.read("dumps/books.csv")
      manager.load_readers_with_books CSV.read("dumps/readers_with_books.csv")
    end

    def create_dump
      FileUtils.mkdir("dumps")
      CSV.open("dumps/readers.csv", "wb") do |csv|
        csv << manager.prepare_readers_for_csv
      end
      CSV.open("dumps/books.csv", "wb") do |csv|
        csv << manager.prepare_books_for_csv
      end
      CSV.open("dumps/readers_with_books.csv", "wb") do |csv|
        csv << manager.prepare_readers_with_books_for_csv
      end
    end

  end

end
