require("minitest/autorun")
require_relative("../songs.rb")

class SongTest < MiniTest::Test


  def setup
    @song1 = Song.new("Everybody Wants to Rule the World", "Tears for Fears")
    @song2 = Song.new("Sweet Dreams", "The Eurythmics")
  end

  def test_song_has_name
    assert_equal("Sweet Dreams", @song2.name())
  end

  def test_song_has_artist
    assert_equal("Tears for Fears", @song1.artist())
  end

  def test_song_can_identify_self
    assert_equal("This is Sweet Dreams, by The Eurythmics", @song2.identify_self())
  end


end
