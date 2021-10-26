require_relative 'book'
require_relative 'music_al'
require_relative 'game'

module CreateLogics
  def create_book; end

  def create_music_album
    print 'Is the album available on Spotify? [y/n]: '
    on_spotify = gets.chomp.downcase == 'y'

    MusicAlbum.new(on_spotify, publish_date)
  end

  def create_game; end

  def publish_date
    print 'Publish date? (YYYY/MM/DD): '
    Time.parse gets.chomp
  end
end
