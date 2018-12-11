require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')
require_relative('../room')


class TestGuest < Minitest::Test

  def setup
    @guest_tom = Guest.new("Tom",50.00)
  end

  def test_guest_name
    assert_equal("Tom", @guest_tom.name)
  end

  def test_guest_money
    assert_equal(50.00, @guest_tom.guest_money)
  end

end
