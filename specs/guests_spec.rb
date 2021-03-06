require("minitest/autorun")
require_relative("../guests.rb")
require_relative("../songs.rb")
require_relative("../rooms.rb")
require_relative("../bars.rb")
require_relative("../drinks.rb")

class GuestTest < MiniTest::Test


  def setup
    @song = Song.new("Billie Jean", "Michael Jackson")

    @guest1 = Guest.new("Hall", 20, @song)
    @guest2 = Guest.new("Oates", 9, @song)

    @room1 = Room.new("Eighties", [@song], 4)
    @room2 = Room.new("Ninties", [], 2)

    @drink1 = Drink.new("beer", 4)
    @drink2 = Drink.new("wine", 5)

    @bar = Bar.new(@room, [@drink1], 50)
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

  def test_is_favourite_song_on_room_playlist__song_present
    @room1.add_guest(@guest1)
    assert_equal(true, @guest1.is_favourite_song_here?(@room1))
  end

  def test_is_favourite_song_on_room_playlist__song_not_present
    @room2.add_guest(@guest1)
    assert_equal(false, @guest1.is_favourite_song_here?(@room2))
  end

  def test_reaction_to_favourite_song_presence__song_is_pres
    @room1.add_guest(@guest1)
    assert_equal("Yass, they have Billie Jean!", @guest1.check_for_favourite_song(@room1))
  end

  def test_reaction_to_favourite_song_presence__song_not_present
    @room2.add_guest(@guest1)
    assert_equal("Boo", @guest1.check_for_favourite_song(@room2))
  end

  def test_guest_can_buy_drink_sufficient_money_and_stock
    skip
    @guest1.buy_drink("beer")
    assert_equal(16, @guest1.wallet())
  end

  def test_add_drink_array_to_guest
    order = [@drink1]
    @guest1.add_drink(order)
    assert_equal([@drink1], @guest1.drinks())
  end


end
