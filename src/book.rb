require_relative 'items'
require_relative 'label'
# require_relative 'modules/store_json'
require 'json'
class Book < Items
  # include StoreJson
  attr_accessor :publisher, :cover_state, :books
  # attr_reader
  @books = []
  @labels = []
  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def label=(label)
    @label = label
  end
  def can_be_archived?
    super || (@cover_state == 'bad')
  end

  def self.save_data_to_json(file_name, data)
    existing_data = []
    if File.exist?(file_name)
      existing_data = JSON.parse(File.read(file_name))
    end

    combined_data = existing_data + data.map(&:to_hash)

    File.open(file_name, 'w') do |file|
      file.write(JSON.generate(combined_data))
    end
  end
  def self.display_all_books
    if File.exist?('local_db/books.json')
      books_data = JSON.parse(File.read('local_db/books.json'))
      puts 'List of books :'
      books_data.each do |book|
        puts "ID: #{book['id']}, Publisher: #{book['publisher']}, Cover State: #{book['cover_state']}, Publish Date: #{book['publish_date']}"
      end
    else
      puts 'No books found.'
    end
  end

  def self.publish_date_input
    puts 'Enter book publish date :'
    gets.chomp
  end

  def self.cover_state_input
    puts 'Enter book Cover state :'
    gets.chomp
  end

  def self.publisher_input
    puts 'Enter book publisher :'
    gets.chomp
  end

  def self.add_book
    publisher = publisher_input
    cover_state = cover_state_input
    publish_date = publish_date_input
    book = Book.new(publisher, cover_state, publish_date)
    @books << book
    label = Label.new("Label Title", "Label Color", book.id)
    label.add_item(book)
    @labels << label
    book.label = label

    puts "this is the book #{book}  this is the label #{label} the relation #{book.label} the other relationsip #{label.items}"
  end

  def self.books
    @books
  end

  def self.labels
    @labels
  end

  def to_hash
    {
      id: id,
      publisher: publisher,
      cover_state: cover_state,
      publish_date: publish_date
    }
  end
end
