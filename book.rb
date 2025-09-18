class Book
  attr_accessor :title, :author, :genre, :read, :rating, :summary, :isbn
  
  def initialize(title, author, genre, isbn = nil)
    @title = title
    @author = author
    @genre = genre
    @isbn = isbn
    @summary = nil
    @read = false
    @rating = nil
  end
  
  def mark_as_read
    @read = true
  end
  
  def mark_as_unread
    @read = false
  end
  
  def display_info
    status = @read ? "Read" : "Unread"
    rating_text = @rating ? " - Rating: #{@rating}/5" : ""
    summary_text = @summary ? "\nSummary: #{@summary}" : ""
    
    puts "#{@title} by #{@author} (#{@genre}) - #{status}#{rating_text}#{summary_text}"
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
  
  # ISBN Validation using RegEx
  def self.valid_isbn?(isbn)
    return false if isbn.nil? || isbn.empty?
    
    # Remove hyphens, spaces, and other formatting
    clean_isbn = isbn.gsub(/[-\s]/, '')
    
    # ISBN-10: 10 digits, last can be X
    isbn10_pattern = /\A\d{9}[\dX]\z/
    # ISBN-13: 13 digits
    isbn13_pattern = /\A\d{13}\z/
    
    clean_isbn.match?(isbn10_pattern) || clean_isbn.match?(isbn13_pattern)
  end
  
  def valid_isbn?
    Book.valid_isbn?(@isbn)
  end
  
  def set_isbn(isbn)
    if Book.valid_isbn?(isbn)
      @isbn = isbn
      puts "ISBN set successfully"
    else
      puts "Invalid ISBN format. Use 10 or 13 digits (10-digit can end with X)"
    end
  end
  
  # Author name formatting
  def formatted_author
    return @author unless @author.include?(',')
    
    # Handle "Last, First" format
    if @author.match(/^([^,]+),\s*(.+)$/)
      last_name = $1.strip
      first_name = $2.strip
      "#{first_name} #{last_name}"
    else
      @author
    end
  end
  
  # Extract author's last name for sorting
  def author_last_name
    # Try "Last, First" format first
    if @author.match(/^([^,]+),/)
      return $1.strip
    end
    
    # Try "First Last" format
    if @author.match(/\b(\w+)$/)
      return $1
    end
    
    # Fallback to full name
    @author
  end
  
  # Extract publication year from title
  def extract_year_from_title
    year_match = @title.match(/\((\d{4})\)/)
    year_match ? year_match[1].to_i : nil
  end
  
  # Detect series information
  def series_info
    # Matches patterns like: "Book 1", "Vol 2", "Volume 3", "#4", "Part II"
    series_patterns = [
      /\b(?:Book|Vol\.?|Volume)\s+(\d+)\b/i,
      /#(\d+)\b/,
      /\bPart\s+(I{1,3}|IV|V|VI{0,3}|IX|X)\b/i
    ]
    
    series_patterns.each do |pattern|
      match = @title.match(pattern)
      return match[1] if match
    end
    
    nil
  end
  
  # Check if title contains subtitle (indicated by colon)
  def has_subtitle?
    @title.include?(':')
  end
  
  # Extract main title (before colon) and subtitle (after colon)
  def main_title
    @title.split(':').first.strip
  end
  
  def subtitle
    parts = @title.split(':')
    return nil if parts.length < 2
    parts[1..-1].join(':').strip
  end
  
  # Clean title by removing common prefixes
  def clean_title_for_sorting
    # Remove articles "The", "A", "An" from beginning for better sorting
    cleaned = @title.gsub(/^(The|A|An)\s+/i, '')
    # Remove publication years in parentheses
    cleaned.gsub(/\s*\(\d{4}\)/, '')
  end
  
  # Validate and clean genre more thoroughly
  def standardize_genre
    return @genre if @genre.nil?
    
    # Common genre mappings
    genre_mappings = {
      /\bscifi?\b/i => 'Science Fiction',
      /\bnon-?fiction\b/i => 'Non-fiction',
      /\bfantasy?\b/i => 'Fantasy',
      /\bmystery?\b/i => 'Mystery',
      /\bromance?\b/i => 'Romance',
      /\bthriller?\b/i => 'Thriller',
      /\bhorror?\b/i => 'Horror',
      /\bbiography?\b/i => 'Biography',
      /\bhistory?\b/i => 'History',
      /\bprogramming?|coding?\b/i => 'Programming',
      /\btechnology?\b/i => 'Technology'
    }
    
    standardized = @genre.strip
    
    genre_mappings.each do |pattern, standard_name|
      if standardized.match?(pattern)
        standardized = standard_name
        break
      end
    end
    
    standardized
  end
  
  def update_display_info
    status = @read ? "Read" : "Unread"
    rating_text = @rating ? " - Rating: #{@rating}/5" : ""
    isbn_text = @isbn && valid_isbn? ? " - ISBN: #{@isbn}" : ""
    summary_text = @summary ? "\nSummary: #{@summary}" : ""
    
    puts "#{@title} by #{formatted_author} (#{standardize_genre}) - #{status}#{rating_text}#{isbn_text}#{summary_text}"
  end
end
