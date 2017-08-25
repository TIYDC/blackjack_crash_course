require_relative 'card'
require 'rubycards'
class Deck
  RANKS = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
  SUITS = %i[clubs diamonds hearts spades].freeze
  def initialize
    @cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << ::RubyCards::Card.new(rank, suit)
      end
    end
  end

  def cards_left
    @cards.length
  end

  def draw
    @cards.shift
  end

  def shuffle
    @cards = @cards.shuffle
  end
end
