class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  
  def artist_name
    self.artist && self.artist.name
  end
  
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end
  
  def genre_name
  
    self.genre.name
  end
  
  def note_contents=(stuff)
    stuff.each do |s|
      if s.length > 0
      note = Note.find_or_create_by(content: s)
      self.notes.push(note)
      end
    end
  end
  
  def note_contents
    self.notes.map do |s|
      s.content
    end
  end
  
  
end
