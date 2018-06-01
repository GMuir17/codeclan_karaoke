class Song


  attr_reader(:name, :artist)

  def initialize(name, artist)
    @name = name
    @artist = artist
  end

  def identify_self()
    return "This is #{@name}, by #{@artist}"
  end

  # def create_playlist_array(song1, song2)
  #   new_playlist = []
  #   new_playlist.push(song1).push(song2)
  #   return new_playlist
  # end

end
