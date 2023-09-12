require_relative '../items'

class MusicAlbum < Items
  attr_accessor :on_spotify, :archived, :publish_date

  def initialize(on_spotify, publish_date)
    super()
    @on_spotify = on_spotify
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    !@archived && @on_spotify
  end
end
