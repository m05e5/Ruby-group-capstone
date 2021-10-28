require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_s
    "\n[Music Album ID #{id}]\non spotify: #{@on_spotify}\n#{super}\n"
  end

  def to_json(*infos)
    super.merge({
                  JSON.create_id => self.class.name,
                  'on_spotify' => @on_spotify
                }).to_json(*infos)
  end

  def self.json_create(object)
    album = new(Date.parse(object['publish_date']), object['on_spotify'])
    album.id = object['id']
    album
  end
end
