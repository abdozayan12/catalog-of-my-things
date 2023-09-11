# frozen_string_literal: true

class Menu
  def display_options
    puts 'Select an option :'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List of games'
    puts '4 - List all genres'
    puts '5 - List all labels'
    puts '6 - List all authors'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts '10 = Exit app'
  end

  def user_option
    gets.chomp
  end
end
