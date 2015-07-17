module Library

  class Dump
    
    attr_reader :manager

    def initialize manager
      @manager = manager
    end 

    def self.load_from_dump_and_init
      readers = [["Ivan Testenko", 16]] # CSV.read("dumps/readers.csv")
      books = [["War and Peace", 1400, 3280, 1996, 1828, 1910, "Leo Tolstoy"]] # CSV.read("dumps/books.csv")
      readers_with_books = [["Ivan Testenko", 16, "War and Peace", 1400, 3280, 1996, 1828, 1910, "Leo Tolstoy", 328, "2015-07-19T18:58:10+00:00"]] # CSV.read("dumps/readers_with_books.csv")
      Library::Manager.load_from_dumps readers, books, readers_with_books
    end

    def create_dump
      FileUtils.mkdir("dumps") unless Dir.exists?("dumps")
      CSV.open("dumps/readers.csv", "wb") do |csv|
        manager.prepare_readers_for_csv.each do |i|
          csv << i
        end
      end
      CSV.open("dumps/books.csv", "wb") do |csv|
        manager.prepare_books_for_csv.each do |i|
          csv << i
        end
      end
      CSV.open("dumps/readers_with_books.csv", "wb") do |csv|
        manager.prepare_readers_with_books_for_csv.each do |i|
          csv << i
        end
      end
    end

  end

end
