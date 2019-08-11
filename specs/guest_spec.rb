require("minitest/autorun")
require("minitest/rg")
require_relative("../guest")

class TestGuest < Minitest::Test

  def setup
    @guest_1 = Guest.new("Marion", 34.00)
    @guest_2 = Guest.new("Lucy", 27.50)
    @guest_3 = Guest.new("Brian", 130.00)
  end

  def test_get_guest_name
    assert_equal("Marion", @guest_1.name)
  end

  def test_get_guest_funds
    assert_equal(34.00, @guest_1.funds)
  end

  def test_pays_tab
    @guest_3.pays_tab(15.00)
    assert_equal(115.00, @guest_3.funds)
  end

end
