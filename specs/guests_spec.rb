require("minitest/autorun")
require_relative("../guests.rb")

class GuestTest < MiniTest::Test


  def setup
    @guest1 = Guest.new("Hall", 20)
    @guest2 = Guest.new("Oates", 9)
  end

  def test_guest_has_name
    assert_equal("Hall", @guest1.name())
  end

  def test_guest_has_money
    assert_equal(20, @guest1.wallet())
  end

end
