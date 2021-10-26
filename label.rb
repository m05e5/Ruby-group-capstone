class Label
  attr_accessor :title, :color
  attr_reader :items, :id

  def initialize(title, color)
    @id = Random.rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_items(item)
    @items << item
    item.add_label self
  end

  def display
    "#{@title} #{@color}"
  end

  def to_json(*info)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'color' => @color
    }.to_json(*info)
  end

  def self.json_create(object)
    label = new(object['title'], object['color'])
    label.id = object['id']
    label
  end
end
