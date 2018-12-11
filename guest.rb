class Guest

  attr_reader  :name, :fav_song
  attr_accessor :guest_money


  def initialize(name, guest_money, fav_song)
    @name = name
    @guest_money = guest_money
    @fav_song = fav_song
  end


end
