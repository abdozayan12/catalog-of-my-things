require './util/json_storage'
require_relative 'functions/find_music_albums'
require_relative 'functions/find_genres'
require_relative 'functions/add_a_music_album'
require_relative 'book'
require_relative 'label'
require_relative 'game'
require_relative 'author'

class App
  def initialize
    @music_albums = JSONStorage.load_data('music_albums').empty? ? [] : JSONStorage.load_data('music_albums')
    @genres = JSONStorage.load_data('genres').empty? ? [] : JSONStorage.load_data('genres')
  end

  ACTIONS = {
    1 => :find_books,
    2 => :find_music_albums,
    3 => :find_games,
    4 => :find_genres,
    5 => :find_labels,
    6 => :find_authors,
    7 => :add_a_book,
    8 => :add_a_music_album,
    9 => :add_a_author,
    10 => :add_a_game,
    0 => :exit
  }.freeze

  def find_books
    Book.display_all_books
  end

  def find_labels
    Label.display_all_labels
  end

  def add_a_book
    Book.add_book
  end

  def find_authors
    Author.list_authors
  end

  def add_a_author
    Author.add_author
  end

  def add_a_game
    Game.add_game
  end

  def find_games
    Game.list_all_games
  end

  def exit
    Book.save_data_to_json('local_db/books.json', Book.books)
    Book.save_data_to_json('local_db/labels.json', Book.labels)
  end

  def display_interactive_console
    puts "\nPlease choose an option by entering a number:
    1.  List all books
    2.  List all music albums
    3.  List all games
    4.  List all genres
    5.  List all labels
    6.  List all authors
    7.  Add a book
    8.  Add a music album
    9.  Add an author
    10. Add a game
    0.  Exit"
  end

  def run
    entry = -1
    until entry.zero?
      display_interactive_console
      entry = gets.chomp.to_i
      option = ACTIONS[entry]
      option ? send(option) : puts('Invalid input')
      JSONStorage.save_data('music_albums', @music_albums)
      JSONStorage.save_data('genres', @genres)
    end
  end
end
