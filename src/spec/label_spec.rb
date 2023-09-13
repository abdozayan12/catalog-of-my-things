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

  describe '.display_all_labels' do
    context 'when there are labels in the database' do
      it 'displays a list of labels' do
        labels = [
          Label.new('Label 1', 'Red', 1),
          Label.new('Label 2', 'Blue', 2)
        ]
        allow(File).to receive(:exist?).and_return(true)
        allow(File).to receive(:read).and_return(JSON.generate(labels.map(&:to_hash)))
        expect { Label.display_all_labels }.to output(/List of labels/).to_stdout
        expect { Label.display_all_labels }.to output(/Title: Label 1/).to_stdout
        expect { Label.display_all_labels }.to output(/Title: Label 2/).to_stdout
      end
    end
  end
end
