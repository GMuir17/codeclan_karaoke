class Guest


  attr_reader(:name, :wallet, :favourite_song, :drinks)

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
    @drinks = []
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

  def add_drink(order)
    # order is an array
    @drinks.concat(order)
  end

  # def buy_drink(drink_name)
  #   drink = @bar.drinks()
  # end


end
