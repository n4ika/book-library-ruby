require_relative 'book'

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

puts "\n=== My Book List ==="
mybook1.display_info
mybook2.display_info
mybook3.display_info

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
