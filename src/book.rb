require_relative 'items'
require_relative 'label'
require 'json'
class Book < Items
  attr_accessor :publisher, :cover_state, :books, :label_id

  @books = []
  @labels = []
  def initialize(publisher, cover_state, publish_date, label_id = nil)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @label_id = label_id
  end

  attr_writer :label

  def can_be_archived?
    super || (@cover_state == 'bad')
  end

  def self.save_data_to_json(file_name, data)
    existing_data = []
    existing_data = JSON.parse(File.read(file_name)) if File.exist?(file_name)

    combined_data = existing_data + data.map(&:to_hash)

    File.write(file_name, JSON.generate(combined_data))
  end

  def self.display_all_books
    if File.exist?('local_db/books.json')
      books_data = JSON.parse(File.read('local_db/books.json'))
      puts 'List of books :'
      books_data.each do |book|
        puts "ID: #{book['id']}, Publisher: #{book['publisher']}, Cover State:
              #{book['cover_state']}, Publish Date: #{book['publish_date']}"
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

  def self.label_title_input
    puts 'Enter label title'
    gets.chomp
  end

  def self.label_color_input
    puts 'Enter label color'
    gets.chomp
  end

  def self.select_labels
    puts 'select a label by entering the ID'
    Label.display_all_labels
    labels_data = JSON.parse(File.read('local_db/labels.json'))
    labels = labels_data.map { |label_data| Label.new(label_data['title'], label_data['color'], label_data['id']) }
    label_input = gets.chomp.downcase
    labels.find { |label| label.id.to_s == label_input }
  end

  def self.add_book
    selected_label = select_label
    return unless selected_label

    publisher = publisher_input
    cover_state = cover_state_input
    publish_date = publish_date_input

    book = Book.new(publisher, cover_state, publish_date, selected_label.id)
    @books << book
    selected_label.add_item(book)
    book.label = selected_label

    puts 'Book created successfully'
  end

  def self.select_label
    puts 'Press 0 to create a new label or 1 to select a label:'
    prompt_select = gets.chomp.to_i

    if prompt_select.zero?
      create_label
    elsif prompt_select == 1
      select_labels
    else
      puts 'Invalid input. Please enter 0 to create a new label or 1 to select a label.'
      nil
    end
  end

  def self.create_label
    label_title = label_title_input
    label_color = label_color_input
    selected_label = Label.new(label_title, label_color)
    @labels << selected_label
    selected_label
  end

  class << self
    attr_reader :books
  end

  class << self
    attr_reader :labels
  end

  def to_hash
    {
      id: id,
      publisher: publisher,
      cover_state: cover_state,
      publish_date: publish_date,
      label_id: label_id
    }
  end
end
