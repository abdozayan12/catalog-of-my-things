require_relative '../book'
require 'json'

RSpec.describe Book do
  before :each do
    @book = Book.new('Publisher', 'Good', Date.new(2022, 1, 1))
  end

  describe '#initialize' do
    it 'creates a new book instance with the given attributes' do
      expect(@book.publisher).to eq('Publisher')
      expect(@book.cover_state).to eq('Good')
      expect(@book.publish_date).to eq(Date.new(2022, 1, 1))
    end

    it 'defaults to nil for label_id when not provided' do
      expect(@book.label_id).to be_nil
    end
  end

  describe '#can_be_archived?' do
    it 'returns true when cover state is "bad"' do
      @book.cover_state = 'bad'
      expect(@book.can_be_archived?).to be_truthy
    end

    it 'returns true when the book is more than 10 years old' do
      eleven_years_ago = Date.today - (11 * 365)
      @book.publish_date = eleven_years_ago
      expect(@book.can_be_archived?).to be_truthy
    end
  end

  describe '.display_all_books' do
    context 'when there are books in the database' do
      it 'displays a list of books' do
        # Create some sample books and save them to the JSON file
        books = [
          Book.new('Publisher 1', 'good', '2023-01-01', 1),
          Book.new('Publisher 2', 'bad', '2023-02-01', 2)
        ]

        # Save the books to the JSON file (mocking the real file operations)
        allow(File).to receive(:exist?).and_return(true)
        allow(File).to receive(:read).and_return(JSON.generate(books.map(&:to_hash)))

        # Expect the output to be printed to the console
        expect { Book.display_all_books }.to output(/List of books/).to_stdout
        expect { Book.display_all_books }.to output(/Publisher: Publisher 1/).to_stdout
        expect { Book.display_all_books }.to output(/Publisher: Publisher 2/).to_stdout
      end
    end
  end

  describe '.add_book' do
    context 'when creating a new label' do
      it 'adds a new book with a new label' do
        allow(Book).to receive(:gets).and_return("0\n", "New Label Title\n", "New Label Color\n")

        allow(Book).to receive(:publisher_input).and_return('New Publisher')
        allow(Book).to receive(:cover_state_input).and_return('good')
        allow(Book).to receive(:publish_date_input).and_return('2023-09-15')

        new_label = Label.new('New Label Title', 'New Label Color')
        allow(Label).to receive(:new).and_return(new_label)

        expect { Book.add_book }.to change { Book.books.length }.by(1)
        expect(Book.books.last.publisher).to eq('New Publisher')
        expect(Book.books.last.cover_state).to eq('good')
        expect(Book.books.last.publish_date).to eq('2023-09-15')
        expect(Book.books.last.label).to eq(new_label)
      end
    end
  end
end
