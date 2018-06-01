class Bar


  attr_reader(:room, :drinks, :til)

  def initialize(room, drinks, til)
    @room = room
    @drinks = drinks
    @til = til
  end

  def add_drink(drink)
    @drinks.push(drink)
  end






end
