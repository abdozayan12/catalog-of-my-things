require_relative 'menu'
require_relative 'src/book'
require_relative 'src/author'
require_relative 'src/game'

menu = Menu.new

puts 'Welcome to my catalog of things app'
at_exit do
  Book.save_data_to_json('local_db/books.json', Book.books)
  Book.save_data_to_json('local_db/labels.json', Book.labels)
end
loop do
  menu.display_options
  case menu.user_option
  when '1'
    Book.display_all_books
  when '2'
    print '2 selected'
  when '3'
    Game.list_all_games
  when '4'
    print '4 selected'
  when '5'
    Label.display_all_labels
  when '6'
    Author.list_authors
  when '7'
    Book.add_book
  when '8'
    print '8 selected'
  when '9'
    Game.add_game
  when '10'
    Author.add_author
  when '11'
    print 'Thank you for using this app!'
    break
  end
  puts "\n"
end
