require_relative 'items'

class Game < Items
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    super()
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    today = Date.today
    year_diff = (today.year - publish_date.year).abs
    super.can_be_archived && year_diff > 2
  end
end
