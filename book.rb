require_relative '/item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, *info)
    super(*info)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  private :can_be_archived?

  def display
    "[Book] publisher: #{@publisher}, cover state: #{@cover_state}"
  end

  def to_json(*info)
    super.merge({
                  JSON.create_id => self.class.name,
                  'publisher' => @publisher,
                  'cover_state' => @cover_state
                }).to_json(*info)
  end

  def self.json_create(object)
    book = new(object['publisher'], object['cover_state'], Time.parse(object['publish_date']))
    book.id = object['id']
    book
  end
end
