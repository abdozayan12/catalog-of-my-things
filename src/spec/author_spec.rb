require_relative '../author'
require_relative '../items'

describe Author do
  before(:each) do
    @author = Author.new('Abdo', 'Zayan')
    @author2 = Author.new('Eric', 'Migot')
    @item = Items.new('2021/09/09')
  end

  it 'correctly initializes an author first name' do
    expect(@author.first_name).to eq('Abdo')
  end

  it 'correctly initializes the author last name' do
    expect(@author2.last_name).to eq('Migot')
  end

  it 'contains auto-generated instance variables' do
    expect(@author.id).to_not be_nil
  end

  it 'adds authors to authors array' do
    expect(Author.authors).to_not be_nil
  end
end
