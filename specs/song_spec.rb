require('minitest/autorun')
require('minitest/rg')
require_relative('../song')
require('pry-byebug')

class SongTest < MiniTest::Test

  def setup
    @song1 =Song.new("title1")
  end

  def test_song_has_name
    assert_equal("title1", @song1.name)
  end


end
