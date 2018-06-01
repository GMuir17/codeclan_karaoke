class Song

  attr_reader(:name, :artist)

  def initialize(name, artist)
    @name = name
    @artist = artist
  end

  def identify_self()
    return "This is #{@name}, by #{@artist}"
  end



end
