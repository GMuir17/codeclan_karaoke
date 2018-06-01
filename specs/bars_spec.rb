require("minitest/autorun")
require_relative("../bars.rb")
require_relative("../drinks.rb")
require_relative("../guests.rb")
require_relative("../rooms.rb")

class BarTest < MiniTest::Test


  def setup
    @drink1 = Drink.new("beer", 4)
    @drink2 = Drink.new("wine", 5)

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


end
