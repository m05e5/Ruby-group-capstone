require_relative 'required_files'

describe MusicAlbum do
  describe '#can_be_archived' do
    context 'when published over 10 years ago and on spotify' do
      item = MusicAlbum.new(Time.new(1930 - 0o1 - 0o1), true)
      it 'should return true' do
        expect(item.can_be_archived?).to be_truthy
      end
    end

    context 'when published over 10 years and not on spotify' do
      item = MusicAlbum.new(Time.new(1930 - 0o1 - 0o1), false)
      it 'should return false' do
        expect(item.can_be_archived?).to be_falsey
      end
    end

    context 'when published less than 10 years and on spotify' do
      item = MusicAlbum.new(Time.now, true)
      it 'should return false' do
        expect(item.can_be_archived?).to be_falsey
      end
    end

    context 'when published less than 10 years and not on spotify' do
      item = MusicAlbum.new(Time.now, false)
      it 'should return false' do
        expect(item.can_be_archived?).to be_falsey
      end
    end
  end
end
