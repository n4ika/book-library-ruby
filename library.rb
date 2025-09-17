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

  def genre_stats
    stats = {}
    @books.each do |book|
      genre = book.genre
      if stats[genre]
        stats[genre] += 1
      else
        stats[genre] = 1
      end
    end
    stats
  end

  def author_books
    authors = {}
    @books.each do |book|
      author = book.author
      authors[author] ||= [] 
      authors[author] << book.title
    end
    authors
  end

  def reading_progress
    total = @books.length
    read_count = read_books.length
    unread_count = unread_books.length
    
    result = {
      total: total,
      read: read_count,
      unread: unread_count,
      percentage_read: total > 0 ? (read_count.to_f / total * 100).round(1) : 0
    }
  end

  def rating_distribution
    distribution = {}
    @books.each do |book|
      if book.rating
        rating = book.rating
        distribution[rating] = (distribution[rating] || 0) + 1  
      end
    end
    distribution
  end

  def display_stats
    puts "\n=== #{@name} Statistics ==="
    
    # Genre breakdown
    puts "\n📚 Books by Genre:"
    genre_stats.each do |genre, count|
      puts "  #{genre}: #{count} book#{count == 1 ? '' : 's'}"
    end
    
    # Reading progress
    progress = reading_progress
    puts "\n📖 Reading Progress:"
    puts "  Total books: #{progress[:total]}"
    puts "  Read: #{progress[:read]} (#{progress[:percentage_read]}%)"
    puts "  Unread: #{progress[:unread]}"
    
    # Rating distribution
    puts "\n⭐ Rating Distribution:"
    if rating_distribution.empty?
      puts "  No rated books yet"
    else
      (1..5).each do |rating|
        count = rating_distribution[rating] || 0
        stars = "⭐" * rating
        puts "  #{stars} (#{rating}): #{count} book#{count == 1 ? '' : 's'}"
      end
    end
    
    # Authors with multiple books
    puts "\n👥 Authors with Multiple Books:"
    multiple_author_books = author_books.select { |author, titles| titles.length > 1 }
    if multiple_author_books.empty?
      puts "  No authors with multiple books"
    else
      multiple_author_books.each do |author, titles|
        puts "  #{author}: #{titles.join(', ')}"
      end
    end
  end
end
