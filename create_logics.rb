require_relative 'book'
require_relative 'music_al'
require_relative 'game'

module CreateLogics
  def create_book
    print 'Publisher: '
    publisher = gets.chomp
    print 'Is cover state good? [good/bad]: '
    cover_state = gets.chomp
    Book.new(publish_date, publisher, cover_state)
  end

  def create_music_album
    print 'Is the album available on Spotify? [y/n]: '
    on_spotify = gets.chomp.downcase == 'y'

    MusicAlbum.new(publish_date, on_spotify)
  end

  def create_game
    print 'Is the game multiplayer? [y/n]: '
    is_multiplayer = gets.chomp.downcase == 'y'
    print 'IT was last played at? (YYYY/MM/DD): '
    last_played_at = Time.parse(gets.chomp)

    Game.new(is_multiplayer, last_played_at, publish_date)
  end

  def publish_date
    print 'Publish date? (YYYY/MM/DD): '
    Time.parse gets.chomp
  end
end
