class Book
  attr_accessor :title, :author, :genre, :read, :rating, :summary

  def initialize(title, author, genre)
    @title = title
    @author = author
    @genre = genre 
    @summary = summary
    @read = false
    @rating = nil
  end

  def mark_as_read
    @read = true
  end

  def mark_as_unread
    @read = false
  end

  def set_rating(rating)
    if rating >= 1 && rating <= 5
      @rating = rating
    else
      puts "Rating must be between 1 and 5"
    end
  end
  
  def add_summary(summary_text)
    @summary = summary_text
  end

  def display_info
    status = @read ? "Read" : "Unread"
    rating_text = @rating ? " - Rating: #{@rating}/5" : ""
    summary_text = @summary ? "\nSummary: #{@summary}" : ""

    puts "#{@title} by #{@author} (#{@genre}) - #{status}#{rating_text}#{summary_text}"
  end
end
