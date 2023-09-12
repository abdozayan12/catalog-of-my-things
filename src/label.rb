class Label
  attr_reader :id, :items
  attr_accessor :title, :color
  
  @@initial_id = 0
  def initialize(title, color, items)
    @@initial_id += 1
    @id = @@initial_id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end