require 'pry'

class Room
  attr_reader :room_name, :songs, :guests, :max_capacity

  def initialize(room_name, songs=[], guests=[], max_capacity)
    @room_name = room_name
    @songs = songs
    @guests = guests
    @max_capacity = max_capacity
  end

  def check_in_guest_to_room(guest)
    if (@guests.length + 1) > @max_capacity
      return "Can't add guest, at max capacity"
    else
      @guests.push(guest)
      return "Guest added to room"
    end
  end

  def check_out_guest_from_room(guest)
    #binding.pry
    @guests.delete(guest)
  end

  def add_song_to_room(song)
    @songs.push(song)
  end


end
