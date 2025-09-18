require_relative 'book'
require_relative 'library'

# Create library
library = Library.new("RegEx Testing Library")

# Create books with various data to test RegEx
book1 = Book.new("The Great Gatsby", "Fitzgerald, F. Scott", "fiction")
book1.set_isbn("978-0-7432-7356-5")

book2 = Book.new("1984", "Orwell, George", "SCIFI")
book2.set_isbn("0451524934")

book3 = Book.new("Code Complete 2", "McConnell, Steve", "programming")
book3.set_isbn("invalid-isbn-123")

book4 = Book.new("Dune", "Herbert,   Frank", "Science Fiction")
book4.set_isbn("978-0-593-09932-9")

book5 = Book.new("The   Handmaid's    Tale", "Atwood, Margaret", "scifi")

# Add books to library
[book1, book2, book3, book4, book5].each { |book| library.add_book(book) }

puts "\n=== Testing RegEx Validation ==="

# Test ISBN validation
puts "\n--- ISBN Validation ---"
test_isbns = ["978-0-7432-7356-5", "0451524934", "invalid-123", "978-0-593-09932-9", ""]
test_isbns.each do |isbn|
  result = Book.valid_isbn?(isbn) ? "✅ Valid" : "❌ Invalid"
  puts "#{isbn.empty? ? '(empty)' : isbn}: #{result}"
end

# Test search functionality
puts "\n--- Search Testing ---"
puts "\nBooks with 'the' in title:"
library.search_by_title("the").each { |book| puts "  - #{book.title}" }

puts "\nBooks by authors with 'George':"
library.search_by_author("George").each { |book| puts "  - #{book.title} by #{book.author}" }

puts "\nFuzzy search for 'complete':"
library.fuzzy_search("complete").each { |book| puts "  - #{book.title}" }

# Test data cleaning
puts "\n--- Before Cleaning ---"
library.books.each { |book| puts "#{book.title} - #{book.genre}" }

library.clean_all_books

puts "\n--- After Cleaning ---"
library.books.each { |book| book.update_display_info }

# Test pattern matching
puts "\n--- Pattern Matching ---"
puts "\nBooks with numbers in title:"
library.books_with_numbers_in_title.each { |book| puts "  - #{book.title}" }

puts "\nBooks with invalid ISBNs:"
library.books_with_invalid_isbn.each { |book| puts "  - #{book.title}: #{book.isbn}" }

# Test book-specific RegEx features
puts "\n--- Book-Specific RegEx Testing ---"

# Create books with more complex titles for testing
test_book1 = Book.new("The Lord of the Rings: The Fellowship of the Ring", "Tolkien, J.R.R.", "fantasy")
test_book2 = Book.new("Dune (1965)", "Herbert, Frank", "SCIFI")
test_book3 = Book.new("Harry Potter Book 1", "Rowling, J.K.", "Fantasy")
test_book4 = Book.new("A Game of Thrones", "Martin, George R.R.", "fantasy")

test_books = [test_book1, test_book2, test_book3, test_book4]

puts "\n--- Title Analysis ---"
test_books.each do |book|
  puts "\nTitle: #{book.title}"
  puts "  Main title: #{book.main_title}"
  puts "  Subtitle: #{book.subtitle || 'None'}"
  puts "  Has subtitle? #{book.has_subtitle?}"
  puts "  Year from title: #{book.extract_year_from_title || 'None'}"
  puts "  Series info: #{book.series_info || 'None'}"
  puts "  Title for sorting: #{book.clean_title_for_sorting}"
  puts "  Standardized genre: #{book.standardize_genre}"
end

puts "\n--- Genre Standardization ---"
test_genres = ["scifi", "non-fiction", "FANTASY", "programming", "mystery"]
test_genres.each do |genre|
  test_book = Book.new("Test", "Author", genre)
  puts "#{genre} → #{test_book.standardize_genre}"
end
