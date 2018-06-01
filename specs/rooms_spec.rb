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

    @room1 = Room.new("Eighties", [song1, song2])
  end

  def test_room_has_name
    p @room1.playlist()
    assert_equal("Eighties", @room1.name())
  end

  def test_display_playlist_by_song_name
    assert_equal(["Everybody Wants to Rule the World", "Sweet Dreams"], @room1.display_playlist())
  end




end
