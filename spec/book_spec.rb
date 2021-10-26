require_relative '../book'

describe Book do
  describe '#can_be_archived' do
    context 'when cover state is bad' do
      item = Book.new(Time.now, 'John doe', 'bad')
      it 'should return true' do
        expect(item.can_be_archived?).to be_truthy
      end
    end
  end
end