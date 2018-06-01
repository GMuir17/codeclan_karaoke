class Guest


  attr_reader(:name, :wallet, :favourite_song)

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def remove_money(money)
    @wallet -= money
  end

  def is_favourite_song_here?(room)
    room_playlist = room.playlist()
    room_playlist.include?(@favourite_song)
  end

  def check_for_favourite_song(room)
    if is_favourite_song_here?(room)
      return "Yass, they have #{@favourite_song.name()}!"
    else
      return "Boo"
    end
  end

end
