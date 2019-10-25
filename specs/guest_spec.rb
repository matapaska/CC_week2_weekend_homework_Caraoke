require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')
require('pry-byebug')

class GuestTest < MiniTest::Test

  def setup

    @song1 = Song.new("title1")
    @song2 = Song.new("title2")
    @song3 = Song.new("title3")

    @playlist = [@song1, @song2, @song3]

    @room1 = Room.new("blue", 4, 50, 0, @song_collection, @playlist1, 4)
    @room2 = Room.new("green", 6, 80, 0, @song_collection, @playlist2, 5)

    @guest1 = Guest.new("Mouse", 100, "@song1")
    @guest2 = Guest.new("Cat", 60, "@song4")

  end

  def test_guest_get_name
    assert_equal("Mouse", @guest1.name)
  end

  def test_guest_get_wallet
    assert_equal(60, @guest2.wallet)
  end

  def test_guest_get_favourite_song
    assert_equal("@song1", @guest1.favourite_song)
  end

  def test_check_funds__sufficient
    result = @guest1.check_funds(@room1)
    assert(result)
  end

  def test_check_funds__not_enough
    result = @guest2.check_funds(@room2)
    refute(result)
  end

  def test_check_in
    
  end

end
