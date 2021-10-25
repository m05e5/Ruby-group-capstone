class Item
  attr_reader :genre, :author, :source, :label, :archived
  attr_accessor :id

  def initialize(publish_date)
    @id = Random(1...1000)
    @publish_date = publish_date
    @archived = false
  end


  private

  def can_be_archived
    (Time.now.year - @publish_date.year) > 10
  end
end