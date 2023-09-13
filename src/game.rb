require_relative 'items'
require_relative 'author'
require 'json'
require 'date'

class Game < Items
  attr_accessor :multiplayer, :last_played_at, :id
  attr_reader :games

  @games = []
  def initialize(publish_date, multiplayer, last_played_at, _id = nil)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def self.add_game()
    puts 'Enter publish date'
    pub_date = gets.chomp
    puts 'Is the game multiplayer(1) or not multiplayer(2) [Enter number [1 or 2]]'
    det = gets.chomp.to_i
    if det == 1
      multiplayer = true
    elsif det == 2
      multiplayer = false
    end

    puts 'Enter the date the game was last played'
    last_played = gets.chomp
    new_game = Game.new(pub_date, multiplayer, last_played)
    @games << new_game
    Game.file_writer
    puts 'New Game added'
  end

  def self.list_all_games
    if File.exist?('local_db/games.json')
      games_json = File.read('local_db/games.json')
      games_data = JSON.parse(games_json)
      @games.clear
      games_data.each do |data|
        game = Game.new(data['publish_date'], data['multiplayer'], data['last_played_at'])
        @games << game
      end
    end

    if @games.empty?
      puts 'No games to display'
    else
      @games.each_with_index do |game, index|
        puts "#{index + 1}. Published on: #{game.publish_date}, " \
             "Multiplayer: #{game.multiplayer}, " \
             "Last played: #{game.last_played_at}"
      end
    end
  end

  def self.file_writer
    File.write('local_db/games.json', @games.map(&:to_hash).to_json)
  end

  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    }
  end

  def to_json(*args)
    to_hash.to_json(*args)
  end

  def can_be_archived?
    today = ::Date.today
    year_diff = (today.year - publish_date.year).abs
    super.can_be_archived && year_diff > 2
  end
end
