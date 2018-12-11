require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')
require_relative('../room')
require 'pry'


class TestRoom < Minitest::Test

  def setup
    @room_1 = Room.new("Pop_Room", [], [])
    @guest_tom = Guest.new("Tom")
    @guest_louise = Guest.new("Louise")
    @guest_ryan = Guest.new("Ryan")
    @song_jump = Song.new("Jump")
    @song_hey_jude = Song.new("Hey Jude")
    @song_perfect = Song.new("Perfect")
    @song_we_will_rock_you = Song.new("We will rock you")
    @room_2 = Room.new("Rock_Room", [@song_jump,@song_hey_jude, @song_we_will_rock_you],
                       [@guest_tom, @guest_louise, @guest_ryan])
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

  def test_songs__populated
    assert_equal("Jump", @room_2.songs[0].song_name)
  end

  def test_guests__populated
    assert_equal("Ryan", @room_2.guests[2].name)
  end

  def test_check_in_guest_to_room
    @room_1.check_in_guest_to_room(@guest_ryan)
    assert_equal('Ryan', @room_1.guests[0].name)
  end

  def test_check_out_guest_from_room__last_guest
    #binding.pry
    @room_2.check_out_guest_from_room(@guest_ryan)
    #binding.pry
    assert_equal(false, @room_2.guests.include?(@guest_ryan))
  end

  def test_check_out_guest_from_room__middle_guest
    @room_2.check_out_guest_from_room(@guest_louise)
    assert_equal(false, @room_2.guests.include?(@guest_louise))
  end

  def test_add_song_to_room__empty_song_library
    @room_1.add_song_to_room(@song_jump)
    assert_equal(true, @room_1.songs.include?(@song_jump))
  end

  def test_add_song_to_room__populated_song_library
    @room_2.add_song_to_room(@song_perfect)
    assert_equal(true, @room_2.songs.include?(@song_perfect))
  end


end
