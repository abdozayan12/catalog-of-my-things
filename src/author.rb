require 'json'
class Author
  attr_accessor :first_name, :last_name, :id, :items, :authors

  @authors = []
  def initialize(first_name, last_name)
    @id = Random.rand(1..1_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def self.add_author
    puts 'Enter first name'
    firstname = gets.chomp
    puts 'Enter last name'
    lastname = gets.chomp
    new_author = Author.new(firstname, lastname)
    @authors << new_author
    Author.file_writer
    puts 'Author added successfully'
  end

  def add_item(item)
    items << item
    item.author = self
  end

  def self.list_authors
    if File.exist?('authors.json')
      authors_json = File.read('authors.json')
      authors_data = JSON.parse(authors_json)
      @authors.clear
      authors_data.each do |data|
        author = Author.new(data['first_name'], data['last_name'])
        author.id = data['id']
        @authors << author
      end
    end

    if @authors.empty?
      puts 'No authors available'
    else
      @authors.each_with_index do |author, index|
        puts "#{index + 1}. #{author.first_name} #{author.last_name}"
      end
    end
  end

  def self.file_writer
    File.write('authors.json', @authors.map(&:to_hash).to_json)
  end

  def to_hash
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name
    }
  end

  def to_json(*args)
    to_hash.to_json(*args)
  end
end
