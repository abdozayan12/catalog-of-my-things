class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  # @initial_id = 0
  def initialize(title, color, id=nil)
    # self.class.increment_initial_id
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_hash
    {
      id: id,
      title: title,
      color: color,
      # publish_date: publish_date
      # Add other attributes as needed
    }
  end
  # def self.increment_initial_id
  #   @initial_id += 1
  # end
  #
  # def self.access_initial_id
  #   @initial_id
  # end
end
