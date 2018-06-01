class Room


  attr_reader(:name, :playlist, :number_of_guests, :room_capacity, :entry_fee)

  def initialize(name, playlist, room_capacity)
    @name = name
    @playlist = playlist
    @room_capacity = room_capacity
    @number_of_guests = []
    @entry_fee = 10
  end

  def display_playlist()
    room_playlist = @playlist.map {|song| song.name()}
    return room_playlist
  end

  def add_song(song)
    @playlist.push(song)
  end

  def add_guest(guest)
    return "Sorry, this room is full" if @number_of_guests.length() == @room_capacity
    @number_of_guests.push(guest)
  end

  def remove_guest(guest)
    @number_of_guests.delete(guest)
  end

end
