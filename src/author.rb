class Author
  attr_accessor :first_name, :last_name
  attr_reader :authors

  @authors = []

  def initialize(first_name, last_name)
    @id = Random.rand(1..1_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
    self.class.authors << self
  end

  def add_item(item)
    items << item
    item.author = self
  end

  def list_authors
    self.class.authors.each_with_index do |author, index|
      puts "#{index + 1}.#{author.first_name} #{author.last_name}"
    end
  end
end
