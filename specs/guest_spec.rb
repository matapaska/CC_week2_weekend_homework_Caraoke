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
    @song4 = Song.new("title4")
    @song5 = Song.new("title5")

    @song_collection = [@song1, @song2, @song3, @song4, @song5]
    @playlist1 = [@song1, @song2, @song3]
    @playlist2 = [@song4, @song5]

    @room1 = Room.new("blue", 4, 50, 0, @song_collection, @playlist1, 4)
    @room2 = Room.new("green", 6, 80, 0, @song_collection, @playlist2, 2)


    @guest1 = Guest.new("Mouse", 100, "@song1")
    @guest2 = Guest.new("Cat", 60, "@song4")
    @guest3 = Guest.new("Owl", 120, "@song6")
    @guest4 = Guest.new("Lion", 30, "@song2")

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

  def test_remove_money
    result = @guest3.remove_money(20)
    assert_equal(100, result)
  end

  def test_check_funds__sufficient
    result = @guest1.check_funds(@room1)
    assert(result)
  end

  def test_check_funds__not_enough
    result = @guest2.check_funds(@room2)
    refute(result)
  end

  @room1 = Room.new("blue", 4, 50, 0, @song_collection, @playlist1, 4)
  @room2 = Room.new("green", 6, 80, 0, @song_collection, @playlist2, 2)


  @guest1 = Guest.new("Mouse", 100, "@song1")
  @guest2 = Guest.new("Cat", 60, "@song4")
  @guest3 = Guest.new("Owl", 120, "@song6")
  @guest4 = Guest.new("Lion", 30, "@song2")

  def test_check_in__enouh_funds_enough_space
    result = @guest3.check_in(@room2)
    assert_equal(3, @room2.number_of_people_in)
    assert_equal(80, @room2.till)
    assert_equal(40, @guest3.wallet)
    assert_equal("Welcome", result)
  end

  def test_check_in__no_funds_enough_space
    result = @guest4.check_in(@room2)
    assert_equal(2, @room2.number_of_people_in)
    assert_equal(0, @room2.till)
    assert_equal(30, @guest4.wallet)
    assert_equal("Try again later", result)
  end

  def test_check_in__no_funds_no_space
    result = @guest4.check_in(@room1)
    assert_equal(4, @room1.number_of_people_in)
    assert_equal(0, @room1.till)
    assert_equal(30, @guest4.wallet)
    assert_equal("Try again later", result)
  end

  def test_check_in__enough_funds_no_space
    result = @guest1.check_in(@room1)
    assert_equal(4, @room1.number_of_people_in)
    assert_equal(0, @room1.till)
    assert_equal(100, @guest1.wallet)
    assert_equal("Try again later", result)
  end

  # def test_check_out
  #   check_out()
  # assert_equal()
  # end
end
