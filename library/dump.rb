module Library

  class Dump

    def self.load_from_dump_and_init
      readers = CSV.read("dumps/readers.csv")
      books = CSV.read("dumps/books.csv")
      readers_with_books = CSV.read("dumps/readers_with_books.csv")
      Library::Manager.load_from_dumps readers, books, readers_with_books
    end

    def self.create_dump  manager
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
