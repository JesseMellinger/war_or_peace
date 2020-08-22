require './card'
require './deck'
require './player'
require './execute_game'
require './card_generator'


standard_deck = CardGenerator.new('cards.txt').cards

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

input =~ /(GO|go)/ ? game.start : (puts "Please restart the program and input 'GO' to start the game!")
