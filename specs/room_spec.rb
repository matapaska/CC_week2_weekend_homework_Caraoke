require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')
require('pry-byebug')

class RoomTest < MiniTest::Test

  def setup

    @song1 = Song.new("title1")
    @song2 = Song.new("title2")
    @song3 = Song.new("title3")
    @song4 = Song.new("title4")
    @song5 = Song.new("title5")

    @song_collection = [@song1, @song2, @song3, @song4, @song5]
    @playlist1 = [@song1, @song2, @song3]
    @playlist2 = [@song4, @song5]

    @room1 = Room.new("blue", 4, 50, 0, @song_collection, @playlist1, 4)
    @room2 = Room.new("green", 6, 80, 0, @song_collection, @playlist2, 5)

    @guest1 = Guest.new("Mouse", 100, "@song1")
    @guest2 = Guest.new("Cat", 60, "@song4")
    @guest3 = Guest.new("Cat", 120, "@song6")
  end

  def test_room_get_name
    assert_equal("blue", @room1.name)
  end

  def test_room_get_capacity
    assert_equal(4, @room1.capacity)
  end

  def test_room_till
    assert_equal(0, @room1.till)
  end

  def test_count_songs_in_collection
    assert_equal(5, @room1.count_songs_in_collection())
  end

  def test_count_songs_in_playlist
    assert_equal(3, @room1.count_songs_in_playlist())
  end

  def test_add_song_to_playlist
    assert_equal(4, @room1.add_song_to_playlist(@song4))
  end

  def test_add_money_to_till
    result = @room1.add_money_to_till(50)
    assert_equal(50, result)
  end

  def test_add_people
    assert_equal(5, @room1.add_people)
  end

  def test_remove_people
    assert_equal(3, @room1.remove_people)
  end

  def test_check_spaces_in_room__enough
    result = @room2.check_spaces_in_room
    assert(result)
  end

  def test_check_spaces_in_room__full
    result = @room1.check_spaces_in_room
    refute(result)
  end


end
