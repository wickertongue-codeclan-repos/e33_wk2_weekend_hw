require("minitest/autorun")
require("minitest/rg")
require_relative("../karaoke_bar")
require_relative("../room")

class TestKaraoke_Bar < Minitest::Test

  def setup
    @karaoke_bar_1 = Karaoke_Bar.new("From The Top")
    @room_1 = Room.new("Rock Room")
    @room_2 = Room.new("Pop Room")
    @room_3 = Room.new("Metal Room")
    @room_4 = Room.new("Eighties Room")
    @room_5 = Room.new("Flight of the Conchords Room")
    @room_6 = Room.new("Animal Sounds Room")
  end

  def test_get_karaoke_bar_name
    assert_equal("From The Top", @karaoke_bar_1.name)
  end

  def test_get_karaoke_bar_rooms__1_room
    @karaoke_bar_1.add_new_room(@room_1)
    assert_equal(1, @karaoke_bar_1.rooms.count)
  end

  def test_get_karaoke_bar_rooms__3_rooms
    @karaoke_bar_1.add_new_room(@room_1)
    @karaoke_bar_1.add_new_room(@room_2)
    @karaoke_bar_1.add_new_room(@room_3)
    assert_equal(3, @karaoke_bar_1.rooms.count)
  end

end
