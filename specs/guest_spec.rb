require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")

class TestGuest < Minitest::Test

  def setup
    @guest_1 = Guest.new("Marion", 34.00)
    @guest_2 = Guest.new("Lucy", 50.00)
    @guest_3 = Guest.new("Brian", 83.20)
  end

  def test_get_guest_name
    assert_equal("Marion", @guest_1.name)
  end

  def test_get_guest_funds
    assert_equal(34.00, @guest_2.funds)
  end

end
