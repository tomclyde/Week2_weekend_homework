require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')
require_relative('../room')


class TestGuest < Minitest::Test

  def setup
    @song_jump = Song.new("Jump")
    @guest_tom = Guest.new("Tom",50.00, @song_jump)
  end

  def test_guest_name
    assert_equal("Tom", @guest_tom.name)
  end

  def test_guest_money
    assert_equal(50.00, @guest_tom.guest_money)
  end

  def test_guest_fav_song
    assert_equal(@song_jump, @guest_tom.fav_song)
  end

end
