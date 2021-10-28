require_relative 'required_files'

describe Label do
  before :each do
    @label = Label.new('Microverse', 'purple')
  end

  describe '#add_item' do
    it 'should add an item' do
      item = Item.new(Time.now)
      @label.add_item item
      expect(@label.items).to include(item)
    end
  end

  describe '#title' do
    it 'should match the correct title' do
      expect(@label.title).to eq('Microverse')
    end
  end

  describe '#color' do
    it 'should match the correct color' do
      expect(@label.color).to eq('purple')
    end
  end
end
