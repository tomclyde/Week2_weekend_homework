require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')
require_relative('../room')


class TestRoom < Minitest::Test

  def setup
    @room_1 = Room.new("Pop_Room", [], [])
  end

  def test_room_name
    assert_equal("Pop_Room", @room_1.room_name)
  end

  def test_songs__empty
    assert_equal([], @room_1.songs)
  end

  def test_guests__empty
    assert_equal([], @room_1.guests)
  end


end
