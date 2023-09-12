require_relative 'items'

class Book < Items
  attr_accessor :publisher, :cover_state
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

  def to_hash
    {
      id: id,
      publisher: publisher,
      cover_state: cover_state,
      publish_date: publish_date
    }
  end
end
