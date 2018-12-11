class Guest

  attr_reader  :name
  attr_accessor :guest_money 


  def initialize(name, guest_money)
    @name = name
    @guest_money = guest_money
  end


end
