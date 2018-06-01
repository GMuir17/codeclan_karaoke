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

  def remove_drink(drink)
    @drinks.delete(drink)
  end

  def add_money(money)
    @til += money
  end

  def take_entry_fee(guest)
    entry_fee = @room.entry_fee()
    return "Not today mate" if guest.wallet() < entry_fee

    fee_to_exchange = guest.remove_money(entry_fee)
    add_money(fee_to_exchange)
  end


end
