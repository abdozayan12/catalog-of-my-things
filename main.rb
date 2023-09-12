require_relative 'menu'
require_relative 'app'

menu = Menu.new
app = App.new

puts 'Welcome to my catalog of things app'
at_exit do
  app.save_data_to_json('local_db/books.json', app.books)
  app.save_data_to_json('local_db/labels.json', app.labels)
end
loop do
  menu.display_options
  case menu.user_option
  when '1'

  when '2'
    print '2 selected'
  when '3'
    print '3 selected'
  when '4'
    print '4 selected'
  when '5'
    print '5 selected'
  when '6'
    print '6 selected'
  when '7'
    app.add_book
  when '8'
    print '8 selected'
  when '9'
    print '9 selected'
  when '10'
    print 'Thank you for using this app!'
    break
  end
  puts "\n"
end
