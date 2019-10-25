require('minitest/autorun')
require('minitest/rb')
require_relative('../song')

class TestSong < MiniTest::Test

  def setup
    @song =Song.new("title")
  end

  

end
