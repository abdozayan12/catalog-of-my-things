require_relative 'src/book'
require_relative 'src/label'
require 'json'
class App

  attr_reader :books, :labels

  def initialize
    @books = []
    @labels = []
  end
  def publish_date_input
    puts 'Enter book publish date :'
    gets.chomp
  end

  def cover_state_input
    puts 'Enter book Cover state :'
    gets.chomp
  end

  def publisher_input
    puts 'Enter book publisher :'
    gets.chomp
  end

  def add_label; end

  def add_book
    publisher = publisher_input
    cover_state = cover_state_input
    publish_date = publish_date_input
    book = Book.new(publisher, cover_state, publish_date)
    @books << book
    label = Label.new("Label Title", "Label Color", book.id)
    label.add_item(book)
    @labels << label
    book.label = label

    # save_data_to_json('local_db/books.json', @books)
    # save_data_to_json('local_db/labels.json', @labels)
  end

  def save_data_to_json(file_name, data)
    existing_data = []
    if File.exist?(file_name)
      existing_data = JSON.parse(File.read(file_name))
    end

    combined_data = existing_data + data.map(&:to_hash)

    File.open(file_name, 'w') do |file|
      file.write(JSON.generate(combined_data))
    end
  end

  def display_all_books
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

  def display_all_labels
    if File.exist?('local_db/labels.json')
      labels_data = JSON.parse(File.read('local_db/labels.json'))
      puts 'List of labels:'
      labels_data.each do |label|
        puts "ID: #{label['id']}, Title: #{label['title']}, Color: #{label['color']}"
      end
    else
      puts 'No labels found.'
    end
  end

end
