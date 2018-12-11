require 'pry'

class Room
  attr_reader :room_name, :songs, :guests

  def initialize(room_name, songs=[], guests=[])
    @room_name = room_name
    @songs = songs
    @guests = guests
  end

  def check_in_guest_to_room(guest)
    @guests.push(guest)
  end

  def check_out_guest_from_room(guest)
    #binding.pry
    @guests.delete(guest)
  end


end
