require("minitest/autorun")
require_relative("../guests.rb")
require_relative("../songs.rb")

class GuestTest < MiniTest::Test


  def setup
    @song = Song.new("Billie Jean", "Michael Jackson")

    @guest1 = Guest.new("Hall", 20, @song)
    @guest2 = Guest.new("Oates", 9, @song)
  end

  def test_guest_has_name
    assert_equal("Hall", @guest1.name())
  end

  def test_guest_has_money
    assert_equal(20, @guest1.wallet())
  end

  def test_remove_money_from_guest
    assert_equal(10, @guest1.remove_money(10))
  end

  def test_guest_has_favourite_song
    assert_equal(@song, @guest1.favourite_song())
  end

end
