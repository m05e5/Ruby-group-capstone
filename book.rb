require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publish_date, publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def display
    "[Book] publisher: #{@publisher}, cover state: #{@cover_state}"
  end

  def to_json(publish_date)
    super.merge({
                  JSON.create_id => self.class.name,
                  'publisher' => @publisher,
                  'cover_state' => @cover_state
                }).to_json(publish_date)
  end

  def self.json_create(object)
    book = new(object['publisher'], object['cover_state'], Time.parse(object['publish_date']))
    book.id = object['id']
    book
  end
end
