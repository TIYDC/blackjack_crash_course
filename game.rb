class Card
  attr_reader "suit", "value"

  def initialize(suit, value)
    @suit = suit
    @value = value.to_s
  end

  def value
    return 10 if ["J", "Q", "K"].include?(@value)
  end

  def to_s
    return @suit + "-" + @value
  end
end

class Deck
  def initialize
    @cards = []
    suits = ["clubs", "hearts", "diamonds", "spades"]
    numbers = ["2", "3", "4", "5", "6", "7", "8", "9", "10"]
    face_cards = ["J", "Q", "K", "A"]

    suits.each do |suit|
      numbers.each do |value|
         @cards << Card.new(suit, value)
      end

      face_cards.each do |value|
         @cards << Card.new(suit, value)
      end
    end

    @cards = @cards.shuffle
  end

  def cards
    @cards
  end

  def to_s
    string = ""

    @cards.each do |card|
      string = string + "\n" + card.to_s
    end

    return string
  end
end

deck = Deck.new

puts deck

ten_of_clubs = Card.new("clubs", "10")

two_of_swords = Card.new("swords", 2)

ten_of_clubs_as_string = ten_of_clubs.to_s
puts ten_of_clubs_as_string
puts two_of_swords
