require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")

class TestRoom < Minitest::Test

  def setup
    @room_1 = Room.new("Rock Room")
    @room_2 = Room.new("Pop Room")
    @room_3 = Room.new("Metal Room")
    @room_4 = Room.new("Eighties Room")
    @guest_1 = Guest.new("Marion", 34.00)
    @guest_2 = Guest.new("Lucy", 50.00)
    @guest_3 = Guest.new("Brian", 83.20)
  end

  def test_get_room_name
    assert_equal("Rock Room", @rock_room.name)
  end

  def test_get_guests_in_room__1_guest
    @room_1.add_new_guest(@guest_1)
    assert_equal(1, @room_1.guests_in_room.count)
  end

  def test_get_guests_in_room__3_guests
    @room_1.add_new_guest(@guest_1)
    @room_1.add_new_guest(@guest_2)
    @room_1.add_new_guest(@guest_3)
    assert_equal(3, @room_1.guests_in_room.count)
  end

  def test_get_playlist
    assert_equal([], @room_1.playlist)
  end

end
