class Room


  attr_reader(:name)

  def initialize(name, playlist)
    @name = name
    @playlist = playlist
    @number_of_guests = []
  end


end
