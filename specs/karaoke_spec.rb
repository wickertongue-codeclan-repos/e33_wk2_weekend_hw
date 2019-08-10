require("minitest/autorun")
require("minitest/rg")
require_relative("../karaoke_bar")
require_relative("../room")

class TestKaraoke_Bar < Minitest::Test

  def setup
    @karaoke_bar_1 = Karaoke_Bar.new("From The Top")
    @rock_room = Room.new("Rock Room")
    @pop_room = Room.new("Pop Room")
    @metal_room = Room.new("Metal Room")
    @eighties_room = Room.new("Eighties Room")
  end

  def test_get_karaoke_bar_name
    assert_equal("From The Top", @karaoke_bar_1.name)
  end

  def test_get_karaoke_bar_rooms__1_room
    @karaoke_bar_1.add_new_room(@rock_room)
    assert_equal(1, @karaoke_bar_1.rooms.count)
  end

  def test_get_karaoke_bar_rooms__3_rooms
    @karaoke_bar_1.add_new_room(@rock_room)
    @karaoke_bar_1.add_new_room(@pop_room)
    @karaoke_bar_1.add_new_room(@metal_room)
    assert_equal(3, @karaoke_bar_1.rooms.count)
  end

end
