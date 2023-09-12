class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  @initial_id = 0
  def initialize(title, color, _items)
    self.class.increment_initial_id
    @id = self.class.access_initial_id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def self.increment_initial_id
    @initial_id += 1
  end

  def self.access_initial_id
    @initial_id
  end
end
