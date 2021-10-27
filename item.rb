class Item
  attr_reader :genre, :author, :game, :label, :archived
  attr_accessor :id

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def add_game(game)
    @game = game
    game.items.push(self) unless game.items.include?(self)
  end

  def move_archive
    @archived = can_be_archived?
  end

  def to_s
    "ID: #{@id}, Published Date: #{@publish_date.strftime('%Y/%m/%d')}, Author: #{@author}, \
    Genre: #{@genre}, Label: #{@label}"
  end

  def to_json(_info)
    {
      'id' => @id,
      'publish_date' => @publish_date.strftime('%Y/%m/%d'),
      'author_id' => @author.id,
      'genre_id' => @genre.id,
      'label_id' => @label.id
    }
  end

  private

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end
end
