require './card'
require './deck'
require './player'
require './turn'

class ExecuteGame
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start()
    num_of_turns = 0

    while num_of_turns < 1000000
      if (player1.has_lost? || player2.has_lost?)
        return declare_winner()
      else
        num_of_turns += 1
      end
      turn = Turn.new(player1, player2)
      winner = turn.winner
      case turn.type
      when :basic then (puts "Turn #{num_of_turns}: #{winner.name} won 2 cards";
      turn.pile_cards; turn.award_spoils(winner))
      when :war then (puts "Turn #{num_of_turns}: WAR - #{winner.name} won 6 cards";
      turn.pile_cards; turn.award_spoils(winner))
      when :mutually_assured_destruction then
      (puts "Turn #{num_of_turns}: *mutually_assured_destruction* 6 cards removed from play";
      turn.pile_cards)
      end
    end
    puts "---- DRAW ----"
  end

  def declare_winner
    puts player1.has_lost? ? "*~*~*~* #{player2.name} has won the game! *~*~*~*" :
    "*~*~*~* #{player1.name} has won the game! *~*~*~*"
  end

end
