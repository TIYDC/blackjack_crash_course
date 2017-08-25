class Player
  attr_reader :name, :money, :hand
  def initialize(name, money)
    @money = money
    @name = name
    @hand = []
  end

  def make_move!
    puts "It's #{name} turn"
    while true
      print "Please enter (h)it or (s)tand: "
      answer = gets.chomp.downcase[0]
      if answer == "h"
        return true
      elsif answer == "s"
        return false
      end
      puts "That is not a valid answer!"
    end
  end

  def has_money?
    @money > 0
  end
end
