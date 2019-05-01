class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name
    if self.genre
      self.genre.name
    end
  end

  def genre_name=(new_name)
    self.genre = Genre.find_or_create_by(name:new_name)
  end

  def genre_id
    if self.genre
      self.genre.id
    end
  end

  def genre_id=(new_id)
    self.genre = Genre.find(new_id)
  end


  def artist_name
    if self.artist
      self.artist.name
    end
  end

  def artist_name=(new_name)
    self.artist = Artist.find_or_create_by(name:new_name)
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

  def note_contents=(contents)
    contents.each do |content|
      if content && (content.length > 0)
        self.notes << Note.create(content:content)
      end
    end
  end
end
