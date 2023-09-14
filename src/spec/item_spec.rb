require 'date'
require_relative '../items'
require_relative '../author'
require_relative '../classes/genre'
require_relative '../label'

RSpec.describe Items do
  before(:each) do
    @today = Date.today
    @item = Items.new(Date.new(2010, 1, 1))
  end

  it 'should be initialized correctly' do
    expect(@item).to be_an_instance_of(Items)
    expect(@item.archived).to eq(false)
  end

  it 'should add genre and associate it' do
    genre = Genre.new('Science Fiction')
    @item.add_genre(genre)
    expect(@item.genre).to eq(genre)
    expect(genre.items).to include(@item)
  end

  it 'should add author' do
    author = Author.new('John', 'Doe')
    @item.add_author(author)
    expect(@item.author).to eq(author)
  end

  it 'should add label' do
    label = Label.new('Publisher', 'yellow')
    @item.add_label(label)
    expect(@item.label).to eq(label)
  end

  it 'should determine if it can be archived' do
    item = Items.new(@today - (0 * 365))
    eleven_years_ago = Date.today - (11 * 365)
    item.publish_date = eleven_years_ago
    expect(item.can_be_archived?).to be_truthy
  end

  it 'should move to archive when possible' do
    item = Items.new(@today - (11 * 365))
    item.move_to_archive
    expect(item.archived).to be_truthy
  end
end
