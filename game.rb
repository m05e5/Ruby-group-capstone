require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, *info)
    super(*info)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Time.now.year - @last_played_at.year) > 2
  end

  def to_s
    "[Game] Multiplayer: #{@multiplayer}, Last played at: #{@last_played_at.strftime('%Y/%m/%d %k:%M')}, #{super}"
  end

  def to_json(*info)
    super.merge({
      JSON.create_id => self.class.name,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at
    }).to_json(*info)
  end

  def self.json_create(object)
    game = new(object['multiplayer'], object['last_played_at'], Time.parse(object['publish_date']))
    game.id = object['id']
    game
  end
end