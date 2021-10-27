require_relative '../book'

describe Book do
  describe '#can_be_archived' do
    context 'when cover state is bad' do
      item = Book.new(Time.now, 'John doe', 'bad')
      it 'It can be archived' do
        expect(item.can_be_archived?).to be_truthy
      end
    end

    context 'when cover state is good' do
      item = Book.new(Time.now, 'John doe', 'good')
      it 'It can not be archived' do
        expect(item.can_be_archived?).to be_falsey
      end
    end
  end
end
