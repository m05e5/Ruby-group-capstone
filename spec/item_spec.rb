require_relative 'required_files'

describe Item do
  before :each do
    @item = Item.new(Time.now)
  end

  describe '#move to archive' do
    context 'Will not item to archive, if too young' do
      it 'will not be archived' do
        @item.move_archive
        expect(@item.archived).to be_falsey
      end
    end

    context 'Will move item to archive, if > 10 years' do
      item = Item.new(Time.new(1997, 0o1, 0o7))
      item.move_archive

      it 'will be archived' do
        expect(item.archived).to be_truthy
      end
    end
  end

  describe '#add_genre' do
    it 'should add genre' do
      @item.add_genre Genre.new('Capstone')
      expect(@item.genre).to be_an_instance_of Genre
    end
  end
end
