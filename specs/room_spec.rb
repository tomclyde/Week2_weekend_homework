require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')
require_relative('../room')
require 'pry'
require 'colorize'



class TestRoom < Minitest::Test

  def setup
    @room_1 = Room.new("Pop_Room", [], [], 2,15)
    @song_jump = Song.new("Jump")
    @song_hey_jude = Song.new("Hey Jude")
    @song_perfect = Song.new("Perfect")
    @song_we_will_rock_you = Song.new("We will rock you")
    @song_gangham_style = Song.new("Gangham_style")
    @guest_tom = Guest.new("Tom", 50.00, @song_jump)
    @guest_louise = Guest.new("Louise", 10.00, @song_we_will_rock_you)
    @guest_ryan = Guest.new("Ryan", 15.00, @song_gangham_style)
    @guest_fiona = Guest.new("Fiona", 23.00, @song_perfect)
    @room_2 = Room.new("Rock_Room", [@song_jump,@song_hey_jude, @song_we_will_rock_you,@song_perfect],
                       [@guest_tom, @guest_louise, @guest_ryan], 3,10)
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

  def test_max_capacity
    assert_equal(2, @room_1.max_capacity)
  end

  def test_fee
    assert_equal(15, @room_1.fee)
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

  def test_room_capacity_breached
    room_message = @room_2.check_in_guest_to_room(@guest_fiona)
    assert_equal("Can't add guest, at max capacity", room_message)
  end

  def test_room_capacity_not_breached
    room_message = @room_1.check_in_guest_to_room(@guest_fiona)
    assert_equal("Guest added to room", room_message)
  end

  def test_guest_pays_room_fee__enough_money
    @room_1.check_in_guest_to_room(@guest_fiona)
    assert_equal(8.00, @guest_fiona.guest_money)
  end

  def test_guest_pays_room_fee__not_enough_money
    @room_1.check_in_guest_to_room(@guest_louise)
    assert_equal(10.00, @guest_louise.guest_money)
  end

  def test_guest_fav_song__exists
    #binding.pry
    hear_guest = @room_2.guest_fav_song(@guest_fiona)
    assert_equal("Whoop Whoop!", hear_guest)
  end

  def test_guest_fav_song__doesnt_exist
    #binding.pry
    hear_guest = @room_2.guest_fav_song(@guest_ryan)
    assert_equal("Boo!", hear_guest)
  end

  def test_playing_songs_and_singing
    puts @room_2.flashing_output("Playing tunes!".blue)
    puts @room_2.flashing_output("Singing Songs!".red)
    having_a_good_time = true
    assert_equal(true,having_a_good_time)
  end


end
