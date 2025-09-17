require_relative 'book'
require_relative 'library'

# my_library = Library.new("Naïka's Personal Library")

# book1 = Book.new("The Great Gatsby", "F. Scott Fitzgerald", "Fiction")
# book2 = Book.new("Sapiens", "Yuval Noah Harari", "Non-fiction")
# book3 = Book.new("1984", "George Orwell", "Fiction")
# book4 = Book.new("Clean Code", "Robert C. Martin", "Programming")
# book5 = Book.new("The Hobbit", "J.R.R. Tolkien", "Fantasy")
# mybook1 = Book.new("How to Win Friends & Influence People", "Dale Carnegie", "Non-fiction")
# mybook2 = Book.new("Behind Her Eyes", "Sarah Pinsborough", "Fiction")
# mybook3 = Book.new("Along Came a Spider", "James Patterson", "Fiction")

# puts "=== Initial Book List ==="
# book1.display_info
# book2.display_info
# book3.display_info
# book4.display_info
# book5.display_info
# mybook1.display_info
# mybook2.display_info
# mybook3.display_info

# puts "=== Adding Books to Library ==="
# my_library.add_book(book1)
# my_library.add_book(book2)
# my_library.add_book(book3)
# my_library.add_book(book4)
# my_library.add_book(book5)

# puts "\n=== After marking some as read and rating ==="
# book1.mark_as_read
# book1.set_rating(4)
# book3.mark_as_read
# book3.set_rating(5)
# book2.mark_as_read
# book2.set_rating(4)
# mybook2.mark_as_read
# mybook2.set_rating(4)
# mybook3.mark_as_unread

# book1.display_info
# book2.display_info
# book3.display_info
# book4.display_info
# book5.display_info
# mybook1.display_info
# mybook2.display_info
# mybook3.display_info

# puts "\n=== Testing Summary Feature ==="
# book1.add_summary("A classic American novel about the Jazz Age and the American Dream.")
# book1.display_info

# book2.add_summary("A brief history of humankind exploring how Homo sapiens came to dominate Earth.")
# book2.display_info

# book4.display_info

# # Test library methods
# my_library.list_all_books

# puts "\n=== Unread Books ==="
# unread = my_library.unread_books
# unread.each { |book| book.display_info }

# puts "\n=== Fiction Books ==="
# fiction_books = my_library.books_by_genre("Fiction")
# fiction_books.each { |book| book.display_info }

# puts "\n=== Books by Authors with 'George' ==="
# george_books = my_library.books_by_author("George")
# george_books.each { |book| book.display_info }

# puts "\n=== Highest Rated Books ==="
# top_books = my_library.highest_rated_books
# top_books.each { |book| book.display_info }


# Create library and books (from previous days)
my_library = Library.new("Naïka's Personal Library")

book1 = Book.new("The Great Gatsby", "F. Scott Fitzgerald", "Fiction")
book2 = Book.new("Sapiens", "Yuval Noah Harari", "Non-fiction")
book3 = Book.new("1984", "George Orwell", "Fiction")
book4 = Book.new("Clean Code", "Robert C. Martin", "Programming")
book5 = Book.new("The Hobbit", "J.R.R. Tolkien", "Fantasy")

# Add some books by the same author to test multiple books feature
book6 = Book.new("Animal Farm", "George Orwell", "Fiction")
book7 = Book.new("Becoming", "Michelle Obama", "Non-fiction")
book8 = Book.new("Code Complete", "Steve McConnell", "Programming")

# Add all books
[book1, book2, book3, book4, book5, book6, book7, book8].each do |book|
  my_library.add_book(book)
end

# Set some reading status and ratings
book1.mark_as_read
book1.set_rating(4)
book2.mark_as_read  
book2.set_rating(5)
book3.mark_as_read
book3.set_rating(5)
book6.mark_as_read
book6.set_rating(4)
book7.mark_as_read
book7.set_rating(3)

puts "\n=== Testing Hash Methods ==="

# Test genre statistics
puts "\n--- Genre Stats ---"
stats = my_library.genre_stats
puts stats  # Shows the hash directly
puts

# Test author books
puts "--- Author Books ---"
authors = my_library.author_books
authors.each do |author, titles|
  puts "#{author}: #{titles.join(', ')}"
end

# Test reading progress
puts "\n--- Reading Progress ---"
progress = my_library.reading_progress
puts "Read #{progress[:read]} out of #{progress[:total]} books (#{progress[:percentage_read]}%)"

# Test the full stats display
my_library.display_stats
