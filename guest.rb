class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song

  end

  def remove_money (amount)
    @wallet -= amount
  end

  def check_funds(room)
    return @wallet >= room.price
  end

  def check_in(room)
    if check_funds(room) && room.check_spaces_in_room
      room.add_people
      room.add_money_to_till(room.price)
      remove_money(room.price)
      return "Welcome"
    else
      return "Try again later"
    end
  end

  def check_out(room)
    room.remove_people
  end




end
