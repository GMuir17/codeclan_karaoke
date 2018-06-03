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

  def create_order(drink_type, drink_number)
    new_order = []
    counter = 0
    for drink in @drinks
      return if counter == drink_number
      if drink.type() == drink_type
        new_order.push(drink)
        counter += 1
      end
    end
    return new_order
  end

  def add_array_of_drinks(drink_array)
    @drinks.concat(drink_array)
  end

  def remove_array_of_drinks(drink_array)
    for drink in drink_array
      @drinks.delete(drink)
    end
  end

  def sell_drink(guest, order)
    remove_array_of_drinks(order)
    guest.add_drink(order)
  end

end
