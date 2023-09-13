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

  describe '#to_hash' do
    it 'returns a hash representation of the book' do
      hash = @book.to_hash
      expect(hash).to be_a(Hash)
      expect(hash[:publisher]).to eq('Publisher')
      expect(hash[:cover_state]).to eq('Good')
      expect(hash[:publish_date]).to eq(Date.new(2022, 1, 1))
      expect(hash[:label_id]).to be_nil
    end
  end
end
