require_relative 'items'

class Genre
    def initialize(name)
      @id = Random.rand(1..100)
      @name = name
      @items = []
    end
end