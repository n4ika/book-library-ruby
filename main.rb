require_relative 'book'
require_relative 'library'

# Create library and books (from previous days but with ISBN support)
my_library = Library.new("Naïka's Personal Library")

book1 = Book.new("The Great Gatsby", "F. Scott Fitzgerald", "Fiction")
book1.set_isbn("978-0-7432-7356-5")
book2 = Book.new("Sapiens", "Yuval Noah Harari", "Non-fiction")
book3 = Book.new("1984", "George Orwell", "Fiction")
book4 = Book.new("Clean Code", "Robert C. Martin", "Programming")
book5 = Book.new("The Hobbit", "J.R.R. Tolkien", "Fantasy")

# Add some books by the same author and with ISBNs
book6 = Book.new("Animal Farm", "George Orwell", "Fiction")
book6.set_isbn("978-0-452-28424-1")
book7 = Book.new("Becoming", "Michelle Obama", "Non-fiction")
book8 = Book.new("Code Complete", "Steve McConnell", "Programming")

# Add all books
[book1, book2, book3, book4, book5, book6, book7, book8].each do |book|
  my_library.add_book(book)
end

# Set some reading status and ratings
book1.mark_as_read
book1.set_rating(4)
book1.add_summary("A classic American novel about the Jazz Age and the American Dream.")

book2.mark_as_read  
book2.set_rating(5)
book2.add_summary("A brief history of humankind exploring how Homo sapiens came to dominate Earth.")

book3.mark_as_read
book3.set_rating(5)

book6.mark_as_read
book6.set_rating(4)

book7.mark_as_read
book7.set_rating(3)

# Display all books with enhanced info
my_library.list_all_books

# Show statistics
my_library.display_stats

puts "\n=== Testing New RegEx Features ==="

# Test search functionality
puts "\n--- Search Results ---"
puts "Books with 'code' in title:"
my_library.search_by_title("code").each { |book| puts "  - #{book.title}" }

puts "\nBooks by George:"
my_library.search_by_author("George").each { |book| puts "  - #{book.title}" }

puts "\nFuzzy search for 'clean':"
my_library.fuzzy_search("clean").each { |book| puts "  - #{book.title}" }

# Test ISBN validation
puts "\n--- ISBN Validation ---"
my_library.books.each do |book|
  if book.isbn
    status = book.valid_isbn? ? "✅ Valid" : "❌ Invalid"
    puts "#{book.title}: #{book.isbn} - #{status}"
  else
    puts "#{book.title}: No ISBN"
  end
end
