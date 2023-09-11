require_relative 'items'

class Game < Items
  attr_accessor :multiplayer, :last_played_at
  attr_reader :games

  @games = []
  def initialize(options = {})
    super(options[:genre], options[:author], options[:source], options[:label], options[:publish_date])
    @multiplayer = options[:multiplayer]
    @last_played_at = options[:last_played_at]
    self.class.games << self
  end

  private

  def can_be_archived?
    today = Date.today
    year_diff = (today.year - publish_date.year).abs
    super.can_be_archived && year_diff > 2
  end

  def list_all_games
    @games.each_with_index do |game, index|
      puts "#{index + 1}. Title: #{game.label}, Genre: #{game.genre}"
    end
  end
end
