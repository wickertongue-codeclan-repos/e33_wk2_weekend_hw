require("minitest/autorun")
require("minitest/rg")
require_relative("../room")
require_relative("../guest")

class TestRoom < Minitest::Test

  def setup
    @rock_room = Room.new("Rock Room")
    @pop_room = Room.new("Pop Room")
    @metal_room = Room.new("Metal Room")
    @eighties_room = Room.new("Eighties Room")
    @guest_1 = Guest.new("Marion", 34.00)
    @guest_2 = Guest.new("Lucy", 50.00)
    @guest_3 = Guest.new("Brian", 83.20)
  end

  def test_get_room_name
    assert_equal("Rock Room", @rock_room.name)
  end

  def test_get_guests_in_room__1_guest
    @rock_room.add_new_guest(@guest_1)
    assert_equal(1, @rock_room.guests_in_room.count)
  end

  def test_get_guests_in_room__3_guests
    @rock_room.add_new_guest(@guest_1)
    @rock_room.add_new_guest(@guest_2)
    @rock_room.add_new_guest(@guest_3)
    assert_equal(3, @rock_room.guests_in_room.count)
  end

  def test_get_playlist
    assert_equal([], @rock_room.playlist)
  end

end
