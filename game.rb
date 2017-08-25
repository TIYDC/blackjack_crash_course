require 'pry'
require_relative 'game'
require_relative 'player'
require_relative 'deck'

class Game
  def initialize
    @deck = Deck.new
    @deck.shuffle
  end

  def play
    @player = Player.new('Player', 100)
    @dealer = Player.new('Dealer', 100_000)

    # while @player.has_money? && play_again?
    2.times do
      deal(@player)
      deal(@dealer)
    end

    display!

    while hand_value(@player.hand) < 21 && @player.make_move!
      deal(@player)
      display!
    end

    puts "Dealer's Turn"
    while hand_value(@dealer.hand) < 21 && @dealer.make_move!
      deal(@dealer)
      display!
    end

    case
    when player_won? || hand_value(@dealer.hand) > 21
      puts "You Won!!!!"
    when dealer_won? || hand_value(@player.hand) > 21
      puts "The Dealer won!!!"
    end
  end

  def player_won?
    hand_value(@player.hand) < 21 && (hand_value(@player.hand) > hand_value(@dealer.hand))
  end

  def dealer_won?
    hand_value(@dealer.hand) < 21 && (hand_value(@dealer.hand) > hand_value(@player.hand))
  end

  def deal(player)
    player.hand << @deck.draw
  end

  def display!
    system("clear")
    puts "Player Hand #{hand_value(@player.hand)}"
    puts @player.hand


    puts "Dealer Hand #{hand_value(@dealer.hand)}"
    puts @dealer.hand.last.to_s
  end

  def hand_value(hand)
    aces = 0

    total = hand.reduce(0) do |acc, card|
      if ["Jack", "Queen", "King"].include?(card.rank)
        acc + 10
      elsif card.rank == "Ace"
        aces += 1
        acc
      else
        acc + card.rank.to_i
      end
    end

    aces.times do
      if total > 10
        total += 1
      else
        total += 11
      end
    end

    total
  end

  def play_again?
    puts "Do you want to play?"
    # loop until you get a good answer and return
    while true
      print "Please enter (y)es or (n)o: "
      answer = gets.chomp.downcase
      if answer[0] == "y"
        return true
      elsif answer[0] == "n"
        return false
      end
      puts "That is not a valid answer!"
    end
  end
end
