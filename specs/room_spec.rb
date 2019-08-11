require("minitest/autorun")
require("minitest/rg")
require("pry")

require_relative("../room")
require_relative("../guest")
require_relative("../song")

class TestRoom < Minitest::Test

  def setup
    @room_1 = Room.new("Rock Room", 12)
    @room_2 = Room.new("Pop Room", 5)
    @room_3 = Room.new("Metal Room", 4)
    @room_4 = Room.new("Eighties Room", 10)
    @guest_1 = Guest.new("Marion", 34.00)
    @guest_2 = Guest.new("Lucy", 27.50)
    @guest_3 = Guest.new("Brian", 130.00)
    @song_1 = Song.new("Dancing Barefoot", "Patti Smith", "Rock")
    @song_2 = Song.new("A Forest", "The Cure", "Rock")
    @song_3 = Song.new("A.M. 180", "Grandaddy", "Rock")
  end

  def test_get_room_name
    assert_equal("Rock Room", @room_1.name)
  end

  def test_get_max_space
    assert_equal(12, @room_1.max_space)
  end

  def test_get_guests_in_room__1_guest
    @room_1.add_guest_to_room(@guest_1)
    assert_equal(1, @room_1.guests_in_room.count)
  end

  def test_get_guests_in_room__3_guests
    @room_1.add_guest_to_room(@guest_1)
    @room_1.add_guest_to_room(@guest_2)
    @room_1.add_guest_to_room(@guest_3)
    assert_equal(3, @room_1.guests_in_room.count)
  end

  def test_get_playlist
    assert_equal([], @room_1.playlist)
  end

  def test_song_added_to_playlist__2_songs
    @room_1.add_to_playlist(@song_1)
    @room_1.add_to_playlist(@song_2)
    assert_equal(2, @room_1.playlist.count)
  end

  def test_remove_guest___3_guests
    @room_1.add_guest_to_room(@guest_1)
    @room_1.add_guest_to_room(@guest_2)
    @room_1.add_guest_to_room(@guest_3)
    @room_1.remove_guest_from_room(@guest_2)
    @room_1.remove_guest_from_room(@guest_3)
    assert_equal(1, @room_1.guests_in_room.count)
  end

  def test_clear_room
    @room_1.add_guest_to_room(@guest_1)
    @room_1.add_guest_to_room(@guest_2)
    @room_1.add_guest_to_room(@guest_3)
    @room_1.clear_room
    assert_equal(0, @room_1.guests_in_room.count)
  end

  def test_current_space_in_room
    assert_equal(4, @room_3.current_space)
  end

end
