require_relative 'book'
require_relative 'game'
require_relative 'music_al'

module ListLogic
  def list_items
    puts 'Please select an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    option = gets.chomp

    case option
    when '1'
      list_books
    when '2'
      list_music_albums
    when '3'
      list_games
    else
      puts 'That is not a valid input'
    end
  end

  def list_genres
    @genres.each { |genre| puts genre }
  end

  def list_authors
    @authors.each { |author| puts author }
  end

  def list_labels
    @labels.each { |label| puts label }
  end

  def list_books
    @items.each { |item| puts item if item.instance_of? Book }
  end

  def list_music_albums
    @items.each { |item| puts item if item.instance_of? MusicAlbum }
  end

  def list_games
    @items.each { |item| puts item if item.instance_of? Game }
  end
end
