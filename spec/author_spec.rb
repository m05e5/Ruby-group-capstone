require_relative 'required_files'

describe Author do
  before :each do
    @author = Author.new('George', 'Martins')
  end

  describe '#add_items' do
    it 'should add a new item' do
      item = Item.new Time.now
      @author.add_items item
      expect(@author.items).to include(item)
    end
  end
end
