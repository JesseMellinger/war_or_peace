require './card'
require './deck'
require './player'
require './turn'
require './execute_game'


SUITS = %i[diamond heart spade club]
VALUES = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]


standard_deck = SUITS.flat_map {|suit| VALUES.map.with_index {|value, index| Card.new(suit, value, index + 2)}}.shuffle!

deck1 = Deck.new(standard_deck.pop(26))
deck2 = Deck.new(standard_deck)

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)


puts "Welcome to War! (or Peace) This game will be played with 52 cards."
puts "The players today are Megan and Aurora."
puts "Type 'GO' to start the game!"
puts "------------------------------------------------------------------"
input = gets.chomp

game = ExecuteGame.new(player1, player2)

input == 'GO' ? game.start : "Please restart the program and input 'GO' to start the game!"
