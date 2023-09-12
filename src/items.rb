class Items
  @@next_id = 1

  attr_reader :id

  def initialize
    @id = @@next_id
    @@next_id += 1
  end
end