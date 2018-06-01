class Room


  attr_reader(:name, :playlist)

  def initialize(name, playlist)
    @name = name
    @playlist = playlist
    @number_of_guests = []
  end

  def display_playlist()
    room_playlist = @playlist.map {|song| song.name()}
    return room_playlist
  end

end
