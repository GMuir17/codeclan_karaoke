require("minitest/autorun")
require_relative("../guests.rb")

class GuestTest < MiniTest::Test


  def setup
    @guest1 = Guest.new("Hall")
    @guest2 = Guest.new("Oates")
  end

  def test_guest_has_name
    assert_equal("Hall", @guest1.name())
  end


end
