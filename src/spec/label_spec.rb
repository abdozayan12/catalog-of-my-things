require_relative '../label'

describe Label do
  before(:each) do
    @label = Label.new('New Label', 'Red', 1)
  end

  describe '#initialize' do
    it 'creates a new label with the specified title and color' do
      expect(@label.title).to eq('New Label')
      expect(@label.color).to eq('Red')
    end

    it 'assigns a random ID if not provided' do
      expect(@label.id).to eq(1) # Since we provided an ID in before(:each)
      new_label = Label.new('Another Label', 'Blue')
      expect(new_label.id).to be_a(Integer)
    end
  end

  describe '#add_item' do
    context 'when adding an item to the label' do
      it 'adds the item to the label' do
        item = double('Item')
        allow(item).to receive(:label=)
        @label.add_item(item)
        expect(@label.items).to include(item)
      end

      it 'sets the label attribute of the item' do
        item = double('Item')
        expect(item).to receive(:label=).with(@label)
        @label.add_item(item)
      end
    end
  end
end
