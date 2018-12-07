class Room
  attr_reader :room_name, :songs, :guests

  def initialize(room_name, songs=[], guests=[])
    @room_name = room_name
    @songs = songs
    @guests = guests
  end


end
