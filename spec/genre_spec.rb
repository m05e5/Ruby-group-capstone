require_relative 'required_files'

describe Genre do
  before :each do
    @genre = Genre.new 'metal'
  end

  describe '#add_item' do
    it 'should add an item' do
      item = Item.new Time.now
      @genre.add_item item
      expect(@genre.items).to include(item)
    end
  end
end
