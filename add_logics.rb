require_relative 'music_al'
require_relative 'genre'
require_relative 'author'
require_relative 'game'
require_relative 'book'
require_relative 'label'
require 'time'

module AddLogics
  def add_associations(item)
    add_genre item
    add_author item
    add_label item
  end

  def add_genre(item)
    puts 'Select a genre from the following list or Select "n" to add a new genre'
    @genres.each_with_index { |genre, idx| puts "#{idx} - #{genre}" }
    option = gets.chomp.downcase
    genre = nil

    if option == 'n'
      print 'Genre name: '
      genre = Genre.new(gets.chomp)
      @genres << genre
    else
      genre = @genres[option.to_i]
    end
    item.add_genre genre
  end

  def add_author(item)
    puts 'Select an author from the following list or select "n" to add a new author: '
    @authors.each_with_index { |author, idx| puts "#{idx} - #{author}" }
    option = gets.chomp.downcase
    author = nil

    if option == 'n'
      print 'Author first name: '
      first_name = gets.chomp

      print 'Author last name: '
      last_name = gets.chomp

      author = Author.new(first_name, last_name)
      @authors << author
    else
      author = @authors[option.to_i]
    end
    item.add_author author
  end

  def add_label(item)
    puts 'Select a label from the following list or select "n" to add a new label: '
    @labels.each_with_index { |label, idx| puts "#{idx} - #{label} #{label.color}" }
    option = gets.chomp.downcase
    label = nil

    if option == 'n'
      print 'Label title: '
      title = gets.chomp

      print 'Label color: '
      color = gets.chomp

      label = Label.new(title, color)
      @labels << label
    else
      label = @labels[option.to_i]
    end
    item.add_label label
  end
end
