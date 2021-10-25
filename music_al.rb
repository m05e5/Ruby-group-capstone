require_relative 'item'

class MusicAlbum < item
  attr_accessor :on_spotify

  def initialize(on_spotify, *args)
    super(*args)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_s
    "[Music Album] on spotify: #{@on_spotify}, #{super}"
  end

end
   