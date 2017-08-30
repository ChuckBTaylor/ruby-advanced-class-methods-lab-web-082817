class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(new_name = "no title", new_artist = "no artist")
    song = self.new
    song.name = new_name
    song.artist_name = new_artist
    song.save
    song
  end

  def self.new_by_name(name)
    self.create(name)
  end

  def self.create_by_name(name)
    self.create(name)
  end

  def self.find_by_name(to_find)
    self.all.find {|song| song.name == to_find}
  end

  def self.find_or_create_by_name(to_find)
    self.find_by_name(to_find) || self.create_by_name(to_find)
  end

  def self.alphabetical
    self.all.sort {|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    spread = filename.split(" - ")
    self.create(spread.last[0...-4], spread.first)
  end

  def self.create_from_filename(filename)
    spread = filename.split(" - ")
    self.create(spread.last[0...-4], spread.first)
  end

  def self.destroy_all
    self.all.clear
  end

end
