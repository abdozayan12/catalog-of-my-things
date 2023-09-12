require_relative '../items'

class MusicAlbum < Items
  attr_accessor :on_spotify, :archived

  def initialize(on_spotify, publish_date)
    super()
    @on_spotify = on_spotify
    @publish_date = publish_date
    @archived = false
  end

  attr_reader :publish_date

  def publish_date=(new_date)
    @publish_date = new_date
  end

  def can_be_archived?
    !@archived && @on_spotify
  end
end