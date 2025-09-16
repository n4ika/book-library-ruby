class Library
  attr_reader :books, :name
  
  def initialize(name = "My Library")
    @books = [] 
    @name = name
  end
  
  def add_book(book)
    @books << book
    puts "Added '#{book.title}' to #{@name}"
  end
  
  def total_books
    @books.length
  end
  
  def list_all_books
    if @books.empty?
      puts "No books in #{@name}"
      return
    end
    
    puts "\n=== All Books in #{@name} (#{total_books} total) ==="
    @books.each_with_index do |book, index|
      print "#{index + 1}. "
      book.display_info
    end
  end
  
  def unread_books
    @books.select { |book| !book.read }
  end
  
  def read_books
    @books.select { |book| book.read }
  end
  
  def books_by_genre(genre)
    @books.filter { |book| book.genre.downcase == genre.downcase }
  end
  
  def books_by_author(author)
    @books.select { |book| book.author.downcase.include?(author.downcase) }
  end
  
  def highest_rated_books
    rated_books = @books.select { |book| book.rating }
    return [] if rated_books.empty?
    
    max_rating = rated_books.map { |book| book.rating }.max
    rated_books.select { |book| book.rating == max_rating }
  end
end
