class Items
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(genre, author, source, label, publish_date)
    @id = Random.rand(1..1_000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def move_to_archive
    return unless can_be_archived?

    self.archived = true
  end

  private

  def can_be_archived?
    today = Date.today
    year_diff = (today.year - publish_date.year).abs
    year_diff > 10
  end
end
