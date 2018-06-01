require("minitest/autorun")
require_relative("../songs.rb")

class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Everybody Wants to Rule the World", "Tears for Fears")
    @song2 = Song.new("Sweet Dreams", "Eurythmics")
  end

  def test_song_has_name
    assert_equal("Sweet Dreams", @song2.name())
  end







end
