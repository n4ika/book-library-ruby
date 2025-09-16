require_relative 'book'
require_relative 'library'

my_library = Library.new("Naïka's Personal Library")

book1 = Book.new("The Great Gatsby", "F. Scott Fitzgerald", "Fiction")
book2 = Book.new("Sapiens", "Yuval Noah Harari", "Non-fiction")
book3 = Book.new("1984", "George Orwell", "Fiction")
book4 = Book.new("Clean Code", "Robert C. Martin", "Programming")
book5 = Book.new("The Hobbit", "J.R.R. Tolkien", "Fantasy")
mybook1 = Book.new("How to Win Friends & Influence People", "Dale Carnegie", "Non-fiction")
mybook2 = Book.new("Behind Her Eyes", "Sarah Pinsborough", "Fiction")
mybook3 = Book.new("Along Came a Spider", "James Patterson", "Fiction")

puts "=== Initial Book List ==="
book1.display_info
book2.display_info
book3.display_info
book4.display_info
book5.display_info
mybook1.display_info
mybook2.display_info
mybook3.display_info

puts "=== Adding Books to Library ==="
my_library.add_book(book1)
my_library.add_book(book2)
my_library.add_book(book3)
my_library.add_book(book4)
my_library.add_book(book5)

puts "\n=== After marking some as read and rating ==="
book1.mark_as_read
book1.set_rating(4)
book3.mark_as_read
book3.set_rating(5)
book2.mark_as_read
book2.set_rating(4)
mybook2.mark_as_read
mybook2.set_rating(4)
mybook3.mark_as_unread

book1.display_info
book2.display_info
book3.display_info
book4.display_info
book5.display_info
mybook1.display_info
mybook2.display_info
mybook3.display_info

puts "\n=== Testing Summary Feature ==="
book1.add_summary("A classic American novel about the Jazz Age and the American Dream.")
book1.display_info

book2.add_summary("A brief history of humankind exploring how Homo sapiens came to dominate Earth.")
book2.display_info

book4.display_info

# Test library methods
my_library.list_all_books

puts "\n=== Unread Books ==="
unread = my_library.unread_books
unread.each { |book| book.display_info }

puts "\n=== Fiction Books ==="
fiction_books = my_library.books_by_genre("Fiction")
fiction_books.each { |book| book.display_info }

puts "\n=== Books by Authors with 'George' ==="
george_books = my_library.books_by_author("George")
george_books.each { |book| book.display_info }

puts "\n=== Highest Rated Books ==="
top_books = my_library.highest_rated_books
top_books.each { |book| book.display_info }
