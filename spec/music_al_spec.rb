require_relative 'required_files'

describe MusicaAlbum do
  describe '#can_be_achieved' do
    context 'when published over 10 years ago on spotify' do
      item = MusicAlbum.new(true, Time.new(1988, 1, 17))
      it 'should return true' do
        expect(item.can_be_archived?).to be_truthy
      end
    end

    context 'when published over 10 years not on spotify' do
     item = MusicAlbum.new(false, Time.new(1988, 1, 17))
      it 'should return false' do
        expect(item.can_be_archived?).to be_falsey
      end
    end

    context 'when published less than 10 years on spotify' do
     item = MusicAlbum.new(true, Time.now)
      it 'should return false' do
        expect(item.can_be_archived?).to be_falsey
      end
    end

    context 'when published less than 10 years not on spotify' do
     item = MusicAlbum.new(false, Time.now)
      it 'should return false' do
        expect(item.can_be_archived?).to be_falsey
      end
    end
  end
end
