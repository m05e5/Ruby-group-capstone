class Item
  attr_reader :genre, :author, :game, :label, :archived
  attr_accessor :id

  def initialize(publish_date)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless genre.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless genre.items.include?(self)
  end

  def add_game(game)
    @game = game
    game.items.push(self) unless genre.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    (Time.now.year - @publish_date.year) > 10
  end
end