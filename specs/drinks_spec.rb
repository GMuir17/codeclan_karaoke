require("minitest/autorun")
require_relative("../drinks.rb")

class DrinkTest < MiniTest::Test


  def setup
    @drink1 = Drink.new("beer", 4)
  end

  def test_drink_has_type
    assert_equal("beer", @drink1.type())
  end

  def test_drink_has_price
    assert_equal(4, @drink1.price())
  end


end
