require("minitest/autorun")
require("minitest/rg")
require_relative("../song")

class TestSong < Minitest::Test

  def setup
    @song_1 = Song.new("Dancing Barefoot", "Patti Smith", "Rock")
    @song_2 = Song.new("A Forest", "The Cure", "Rock")
    @song_3 = Song.new("A.M. 180", "Grandaddy", "Rock")
  end

  def test_can_get_track_name
    assert_equal("Dancing Barefoot", @song_1.track_name)
  end

  def test_can_get_artist_name
    assert_equal("The Cure", @song_2.artist_name)
  end

  def test_can_get_genre
    assert_equal("Rock", @song_3.genre)
  end

end
