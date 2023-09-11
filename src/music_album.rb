require_relative 'items'

class MusicAlbum < Items
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
  end
end
