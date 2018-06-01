require("minitest/autorun")
require_relative("../rooms.rb")
require_relative("../guests.rb")
require_relative("../songs.rb")

class RoomTest < MiniTest::Test


  def setup
    @guest1 = Guest.new("Hall")
    @guest2 = Guest.new("Oates")

    song1 = Song.new("Everybody Wants to Rule the World", "Tears for Fears")
    song2 = Song.new("Sweet Dreams", "The Eurythmics")
    @song3 = Song.new("The Boys of Summer", "Don Henley")
    @song4 = Song.new("Don't You Want Me", "The Human League")

    @room1 = Room.new("Eighties", [song1, song2])
  end

  def test_room_has_name
    assert_equal("Eighties", @room1.name())
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

  def test_room_has_guest_list
    assert_equal([], @room1.number_of_guests())
  end

  def test_add_guest_to_guest_list
    @room1.add_guest(@guest1)
    assert_equal([@guest1], @room1.number_of_guests())
  end


end
