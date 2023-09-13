require_relative 'menu'
require_relative 'src/book'

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
    print '3 selected'
  when '4'
    print '4 selected'
  when '5'
    Label.display_all_labels
  when '6'
    print '6 selected'
  when '7'
    Book.add_book
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
