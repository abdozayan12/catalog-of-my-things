require_relative 'menu'
require_relative 'src/author'
require_relative 'src/game'

menu = Menu.new

puts 'Welcome to my catalog of things app'

loop do
  menu.display_options
  case menu.user_option
  when '1'
    print '1 selected'
  when '2'
    print '2 selected'
  when '3'
    Game.list_all_games
  when '4'
    print '4 selected'
  when '5'
    print '5 selected'
  when '6'
    Author.list_authors
  when '7'
    print '7 selected'
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
