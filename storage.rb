require 'json'

class Storage
  def store(items, genres, labels, authors)
    File.open('items.json', 'w') { |f| f.write JSON.generate items } unless items.empty?
    File.open('genres.json', 'w') { |f| f.write JSON.generate genres } unless genres.empty?
    File.open('labels.json', 'w') { |f| f.write JSON.generate labels } unless labels.empty?
    File.open('authors.json', 'w') { |f| f.write JSON.generate authors } unless authors.empty?
  end

  def load
    genres = load_file('genres.json')
    authors = load_file('authors.json')
    labels = load_file('labels.json')
    items = load_file('items.json')
    make_relationships(items, genres, authors, labels)

    {
      'genres' => genres,
      'authors' => authors,
      'labels' => labels,
      'items' => items
    }
  end

  def make_relationships(items, genres, authors, labels)
    file = 'items.json'
    if File.exist? file
      json_arr = JSON.parse(File.read(file))
      json_arr.each_with_index do |json, idx|
        author = authors.detect { |elemt| elemt.id == json['author_id'] }
        genre = genres.detect { |elemt| elemt.id == json['genre_id'] }
        label = labels.detect { |elemt| elemt.id == json['label_id'] }

        item = items[idx]
        item.add_author author
        item.add_genre genre
        item.add_label
      end

      items
    else
      []
    end
  end

  def load_file(file)
    if File.exist? file
      JSON.parse(FILE.read(file), create_additions: true)
    else
      []
    end
  end
end

