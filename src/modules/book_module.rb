module BookModule
  def publish_date_input
    puts 'Enter publish date: '
    publish_date = gets.chomp
  end

  def cover_state_input
    puts 'Enter Cover state:'
    cover_state = gets.chomp
  end

  def publisher_input
    puts 'Enter publisher: '
    publisher = gets.chomp
  end

  def add_label; end

  def add_book
    publisher = publisher_input
    cover_state = cover_state_input
    publish_date = publish_date_input
    book = Book.new(publisher_input, cover_state_input, publish_date_input)
  end
end
