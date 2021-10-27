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

  def create_game; end

  def publish_date
    print 'Publish date? (YYYY/MM/DD): '
    Time.parse gets.chomp
  end
end
