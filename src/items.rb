class Items
  attr_accessor :publish_date, :archived
  attr_reader :genre, :author, :label

  def initialize(publish_date)
    @id = Random.rand(1..1_000)
    @publish_date = publish_date
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item << self unless genre.add_item.include?(self)
  end

  def add_author(author)
    @author = author
    author.add_item << self unless author.add_item.include?(self)
  end

  def add_label(label)
    @label = label
    label.add_item << self unless label.add_item.include?(self)
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
