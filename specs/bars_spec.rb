require("minitest/autorun")
require_relative("../bars.rb")
require_relative("../drinks.rb")
require_relative("../guests.rb")
require_relative("../rooms.rb")
require_relative("../songs.rb")

class BarTest < MiniTest::Test


  def setup
    @drink1 = Drink.new("beer", 4)
    @drink2 = Drink.new("wine", 5)
    @drink3 = Drink.new("beer", 5)
    @drink4 = Drink.new("whisky", 5)

    @drink_array = [@drink3, @drink4]

    song1 = Song.new("Everybody Wants to Rule the World", "Tears for Fears")
    song2 = Song.new("Sweet Dreams", "The Eurythmics")

    @guest1 = Guest.new("Hall", 20, song1)
    @guest2 = Guest.new("Oates", 9, song2)

    @room = Room.new("Eighties", [], 4)

    @bar = Bar.new(@room, [@drink1], 50)
  end

  def test_bar_has_room
    assert_equal(@room, @bar.room())
  end

  def test_add_drink_to_bar
    @bar.add_drink(@drink2)
    assert_equal([@drink1, @drink2], @bar.drinks())
  end

  def test_remove_drink_from_bar
    @bar.remove_drink(@drink1)
    assert_equal([], @bar.drinks())
  end

  def test_add_money_to_bar_til
    @bar.add_money(10)
    assert_equal(60, @bar.til())
  end

  def test_take_entry_fee_from_customer__sufficient_money
    @bar.take_entry_fee(@guest1)
    assert_equal(60, @bar.til())
  end

  def test_take_entry_fee_from_customer__insufficient_money
    @bar.take_entry_fee(@guest2)
    assert_equal(50, @bar.til())
    assert_equal("Not today mate", @bar.take_entry_fee(@guest2))
  end

  def test_bar_can_create_order__drink_in_stock
    test_order = @bar.create_order("beer", 1)
    assert_equal([@drink1], test_order)
  end

  def test_bar_can_create_order_drink_not_in_stock
    test_order = @bar.create_order("wine", 1)
    assert_equal([], test_order)
  end

  def test_add_array_of_drinks
    @bar.add_array_of_drinks(@drink_array)
    assert_equal([@drink1, @drink3, @drink4], @bar.drinks())
  end

  def test_remove_array_of_drinks
    @bar.add_array_of_drinks(@drink_array)
    @bar.remove_array_of_drinks(@drink_array)
    assert_equal([@drink1], @bar.drinks())
  end

  def test_sell_drink_to_guest_sufficient_money_and_stock
    order = @bar.create_order("beer", 1)
    @bar.sell_drink(@guest1, order)
    assert_equal([], @bar.drinks())
    assert_equal([@drink1], @guest1.drinks())
    assert_equal(54, @bar.til())
    assert_equal(16, @guest1.wallet())
  end

end
