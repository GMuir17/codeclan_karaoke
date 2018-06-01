require("minitest/autorun")
require_relative("../rooms.rb")
require_relative("../guests.rb")
require_relative("../songs.rb")

class RoomTest < MiniTest::Test


  def setup
    @guest1 = Guest.new("Hall", 20)
    @guest2 = Guest.new("Oates", 9)
    @guest3 = Guest.new("Daryl", 50)

    song1 = Song.new("Everybody Wants to Rule the World", "Tears for Fears")
    song2 = Song.new("Sweet Dreams", "The Eurythmics")
    @song3 = Song.new("The Boys of Summer", "Don Henley")
    @song4 = Song.new("Don't You Want Me", "The Human League")

    @room1 = Room.new("Eighties", [song1, song2], 4)
    @room2 = Room.new("Ninties", [], 2)
  end

  def test_room_has_name
    assert_equal("Eighties", @room1.name())
  end

  def test_room_has_guest_list
    assert_equal([], @room1.number_of_guests())
  end

  def test_room_has_max_capacity
    assert_equal(4, @room1.room_capacity())
  end

  def test_room_has_entry_fee
    assert_equal(10, @room1.entry_fee())
  end

  def test_room_has_til
    assert_equal(0, @room1.til())
  end

  def test_display_playlist_by_song_name
    assert_equal(["Everybody Wants to Rule the World", "Sweet Dreams"], @room1.display_playlist())
  end

  def test_add_song_to_playlist
    @room1.add_song(@song3)
    assert_equal(["Everybody Wants to Rule the World", "Sweet Dreams", "The Boys of Summer"], @room1.display_playlist())
  end

  # def test_add_multiple_songs_to_playlist
  #   @room1.add_multiple_songs(@song)
  # end

  def test_add_guest_to_room__room_empty
    @room1.add_guest(@guest1)
    assert_equal([@guest1], @room1.number_of_guests())
  end

  def test_remove_guest_from_room
    @room1.add_guest(@guest1)
    @room1.remove_guest(@guest1)
    assert_equal([],@room1.number_of_guests())
  end

  def test_add_guest_to_room__room_full
    @room2.add_guest(@guest1)
    @room2.add_guest(@guest2)
    assert_equal("Sorry, this room is full", @room2.add_guest(@guest3))
  end

  def test_add_money_to_til
    assert_equal(20, @room1.add_money(20))
  end

  def test_take_entry_fee_from_customer__sufficient_money
    @room1.take_entry_fee(@guest1)
    assert_equal(10, @room1.til())
  end


end
