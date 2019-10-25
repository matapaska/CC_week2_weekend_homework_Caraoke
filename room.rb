class Room

  attr_reader :name, :capacity, :price, :till, :song_collection, :playlist, :number_of_people_in

  def initialize(name, capacity, price, till, song_collection, playlist, number_of_people_in)
    @name = name
    @capacity = capacity
    @price = price
    @till = till
    @song_collection = song_collection
    @playlist = playlist
    @number_of_people_in = 0
  end

  def count_songs_in_collection
    return @song_collection.length()
  end

  def count_songs_in_playlist
    return @playlist.length()
  end

  def add_song(song)
    @playlist.push(song)
    count_songs_in_playlist
  end

  def add_money_to_till(amount)
    @till += amount
  end

  def add_people
    @number_of_people_in += 1
  end

  def check_spaces_in_room
    if @number_of_people_in < @capacity
      return true
    elsif @number_of_people_in = @capacity
      return false
    end
  end


end
