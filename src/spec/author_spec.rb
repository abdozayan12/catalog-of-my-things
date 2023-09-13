require_relative '../author'
require_relative '../items'

describe Author do
  before(:each) do
    @author = Author.new('Abdo', 'Zayan')
    @author2 = Author.new('Eric', 'Migot')
  end

  it 'correctly initializes an author first name' do
    expect(@author.first_name).to eq('Abdo')
  end

  it 'correctly initializes the author last name' do
    expect(@author2.last_name).to eq('Migot')
  end

  it 'contains auto-generated instance variables' do
    expect(@author.id).to be_truthy
  end
end
