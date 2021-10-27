require_relative './storage'
require_relative './add_logics'
require_relative './create_logics'
require_relative './list_logic'

class App
  include ListLogic
  include AddLogics
  include CreateLogics

  def initialize
    storage = Storage.new
    data = storage.load

    @genres = data['genres']
    @items = data['items']
    @authors = data['authors']
    @labels = data['labels']
  end

  def run
    puts 'Welcome to our catalog of things app'

    loop do
      puts
      actions

      option = gets.chomp

      break if option == '6'

      storage = Storage.new
      storage.store(@items, @genres, @authors, @labels)

      handle_action(option)
    end

    puts 'Thanks for using our app'
  end

  def handle_action(option)
    case option
    when '1'
      list_items
    when '2'
      list_genres
    when '3'
      list_authors
    when '4'
      list_labels
    when '5'
      add_item
    else
      puts 'That is not a valid option'
    end
  end

  def actions
    puts 'Please choose an option by entering a number
    1 - List all items
    2 - List all genres
    3 - List all authors
    4 - List all labels
    5 - add item
    6 - exit'
  end

  def add_item
    puts 'Please choose any option below by entering a number
    1 - Add book
    2 - Add a music album
    3 - Add a game'

    option = gets.chomp
    handle_add_item(option)
  end

  def handle_add_item(option)
    item = nil

    case option
    when '1'
      item = create_book
    when '2'
      item = create_music_album
    when '3'
      item = create_game
    else
      puts 'Please that is not a valid option'
      return nil
    end

    add_associations(item)

    @items << item
    puts 'Item has been added successfully'
  end
end
