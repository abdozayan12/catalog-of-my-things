# frozen_string_literal: true

require_relative 'menu'


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
    print '3 selected'
  when '4'
    print '4 selected'
  when '5'
    print '5 selected'
  when '6'
    print '6 selected'
  when '7'
    print '7 selected'
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
