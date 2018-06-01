class Room


  attr_reader(:name, :playlist, :number_of_guests)

  def initialize(name, playlist)
    @name = name
    @playlist = playlist
    @number_of_guests = []
  end

  def display_playlist()
    room_playlist = @playlist.map {|song| song.name()}
    return room_playlist
  end

  def add_song(song)
    @playlist.push(song)
  end

  def add_guest(guest)
    @number_of_guests.push(guest)
  end

  def remove_guest(guest)
    @number_of_guests.delete(guest)
  end

end
