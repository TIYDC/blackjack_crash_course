require 'minitest/autorun'
require 'minitest/focus'
require 'minitest/pride'
require 'rubycards'

require_relative '../game'
class GameTest < MiniTest::Test
  def setup
    @game = Game.new
  end

  def test_hand_value_with_aces
    assert_equal 11, @game.hand_value([RubyCards::Card.new(:A, :clubs)])
  end
end
