require("minitest/autorun")
require("minitest/rg")
require("pry")

require_relative("../karaoke_bar")
require_relative("../room")
require_relative("../guest")

class TestKaraoke_Bar < Minitest::Test

  def setup
    @karaoke_bar_1 = Karaoke_Bar.new("From The Top")
    @room_1 = Room.new("Rock Room", 12)
    @room_2 = Room.new("Pop Room", 5)
    @room_3 = Room.new("Metal Room", 4)
    @room_4 = Room.new("Eighties Room", 10)
    @guest_1 = Guest.new("Marion", 34.00)
    @guest_2 = Guest.new("Lucy", 27.50)
    @guest_3 = Guest.new("Brian", 130.00)
    @guest_4 = Guest.new("Natasa", 283.74)
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

  def test_get_guests_in_room__3_guests
    @karaoke_bar_1.add_new_room(@room_2)
    @room_2.add_guest_to_room(@guest_2)
    @room_2.add_guest_to_room(@guest_1)
    @room_2.add_guest_to_room(@guest_3)
    assert_equal(@room_2.guests_in_room, @karaoke_bar_1.get_guests_in_room(@room_2))
  end

  def test_get_number_of_guests_in_room__3_guests
    @karaoke_bar_1.add_new_room(@room_2)
    @room_2.add_guest_to_room(@guest_3)
    @room_2.add_guest_to_room(@guest_2)
    @room_2.add_guest_to_room(@guest_1)
    assert_equal(3, @karaoke_bar_1.number_of_guests_in_room(@room_2))
  end

  def test_check_in_guest_to_room__3_guests
    @karaoke_bar_1.add_new_room(@room_2)
    @karaoke_bar_1.check_in(@guest_1, @room_2)
    @karaoke_bar_1.check_in(@guest_2, @room_2)
    @karaoke_bar_1.check_in(@guest_3, @room_2)
    assert_equal(3, @karaoke_bar_1.number_of_guests_in_room(@room_2))
  end

  def test_get_max_space_from_room
    assert_equal(12, @room_1.max_space)
  end

  def test_max_space_drops_when_new_guest_added__3_guests
    @karaoke_bar_1.add_new_room(@room_1)
    @karaoke_bar_1.check_in(@guest_1, @room_1)
    @karaoke_bar_1.check_in(@guest_2, @room_1)
    @karaoke_bar_1.check_in(@guest_3, @room_1)
    assert_equal(9, @room_1.max_space)
  end


  def test_check_out_guest_from_room__3_guests
    @karaoke_bar_1.add_new_room(@room_3)
    @karaoke_bar_1.check_in(@guest_1, @room_3)
    @karaoke_bar_1.check_in(@guest_2, @room_3)
    @karaoke_bar_1.check_in(@guest_3, @room_3)
    @karaoke_bar_1.check_in(@guest_4, @room_3)
    @karaoke_bar_1.check_out_individual(@guest_1, @room_3)
    @karaoke_bar_1.check_out_individual(@guest_2, @room_3)
    @karaoke_bar_1.check_out_individual(@guest_3, @room_3)
    assert_equal(1, @karaoke_bar_1.number_of_guests_in_room(@room_3))
  end

  def test_check_out_room
    @karaoke_bar_1.add_new_room(@room_3)
    @karaoke_bar_1.check_in(@guest_1, @room_3)
    @karaoke_bar_1.check_in(@guest_2, @room_3)
    @karaoke_bar_1.check_in(@guest_3, @room_3)
    @karaoke_bar_1.check_in(@guest_4, @room_3)
    @karaoke_bar_1.check_out_room(@room_3)
    assert_equal(0, @karaoke_bar_1.number_of_guests_in_room(@room_3))
  end


## To Do:

# What happens if there are more guests trying to be checked in than there is free space in the room?
# Karaoke venues usually have an entry fee - So the guests could have money so they can pay it.


end
