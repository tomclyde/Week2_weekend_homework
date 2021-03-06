require 'pry'

class Room
  attr_reader :room_name, :songs, :guests, :max_capacity, :fee

  def initialize(room_name, songs=[], guests=[], max_capacity, fee)
    @room_name = room_name
    @songs = songs
    @guests = guests
    @max_capacity = max_capacity
    @fee = fee
  end

  def check_in_guest_to_room(guest)
    if (@guests.length + 1) > @max_capacity
      return "Can't add guest, at max capacity"
    else
      if guest_pays_room_fee(guest) == "Enough money"
        @guests.push(guest)
        return "Guest added to room"
      else
        return "Not enough money"
      end
    end
  end

  def check_out_guest_from_room(guest)
    #binding.pry
    @guests.delete(guest)
  end

  def add_song_to_room(song)
    @songs.push(song)
  end

  def guest_pays_room_fee(guest)
    if guest.guest_money < @fee
      return "Not enough money"
    else
      guest.guest_money -= @fee
      return "Enough money"
    end
  end

  def guest_fav_song(guest)
    if @songs.include?(guest.fav_song)
      return "Whoop Whoop!"
    else
      return "Boo!"
    end
  end

  def flashing_output(output)
    message = output
    backspace = "\b"
    space = " "

    backspace_array = []
    space_array = []

    length = message.length

    length.times do
        backspace_array << backspace
        space_array << space
      end

    0.upto(3) do
        print message
        sleep 0.5
        print backspace_array.join.to_s + space_array.join.to_s + backspace_array.join.to_s + backspace_array.join.to_s
        sleep 0.5
      end
  end

end
