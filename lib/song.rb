class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
   song = self.new
   song.save
   song
  end
  
  def self.new_by_name(name_of_song)
    s = self.new
    s.name = name_of_song
    s
  end
  
  def self.create_by_name(new_by_name)
    s = self.new
    s.name = new_by_name
    s.save
    s
  end
  
  def self.find_by_name(name)
    @@all.find{|person| person.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    
     row = filename

       data = row.split(" - ")
      artist_name = data[0]
      song_name = data[1].gsub(".mp3", "")

     song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.all
    @@all
  end
  
  def self.new_from_filename(name)
       song = self.new 
    song.name = (name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (name.split(" - ")[0])
    song
  end

  def save
    self.class.all << self
  end

end
