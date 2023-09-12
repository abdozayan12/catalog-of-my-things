require_relative 'src/book'
require_relative 'src/modules/book_module'

class App
  include BookModule
end
