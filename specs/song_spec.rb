require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../song')
require_relative('../room')


class TestSong < Minitest::Test

  def setup
    @song_jump = Song.new("Jump")
    @song_hey_jude = Song.new("Hey Jude")
    @song_we_will_rock_you = Song.new("We will rock you")
  end


  def test_song_name
    assert_equal("Jump", @song_jump.song_name)
  end

end
