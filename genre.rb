class Genre
  attr_accessor :name, :id
  attr_reader :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.add_genre self
  end

  def to_s
    "Genre - Name: #{@name}"
  end

  def to_json(*infos)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name
    }.to_json(*infos)
  end

  def self.json_create(object)
    genre = new(object['name'])
    genre.id = object['id']
    genre
  end
end
