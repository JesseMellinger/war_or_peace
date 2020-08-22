require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/player'
require './lib/execute_game'
require './lib/card_generator'


class ExecuteGameTest < Minitest::Test

  def test_it_exists
    standard_deck = CardGenerator.new('lib/cards.txt').cards

    deck1 = Deck.new(standard_deck.pop(26))
    deck2 = Deck.new(standard_deck)

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = ExecuteGame.new(player1, player2)

    assert_instance_of ExecuteGame, game
  end

  def test_it_has_players
    standard_deck = CardGenerator.new('lib/cards.txt').cards

    deck1 = Deck.new(standard_deck.pop(26))
    deck2 = Deck.new(standard_deck)

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = ExecuteGame.new(player1, player2)

    assert_equal "Megan", player1.name
    assert_equal "Aurora",player2.name
  end

  def test_it_responds_to_start_method
    standard_deck = CardGenerator.new('lib/cards.txt').cards

    deck1 = Deck.new(standard_deck.pop(26))
    deck2 = Deck.new(standard_deck)

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = ExecuteGame.new(player1, player2)

    assert game.respond_to?(:start)
  end

  def test_it_responds_to_declare_winner_method
    standard_deck = CardGenerator.new('lib/cards.txt').cards

    deck1 = Deck.new(standard_deck.pop(26))
    deck2 = Deck.new(standard_deck)

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = ExecuteGame.new(player1, player2)

    assert game.respond_to?(:declare_winner)
  end

  def test_it_can_check_if_player_has_lost
    standard_deck = CardGenerator.new('lib/cards.txt').cards

    deck1 = Deck.new(standard_deck.pop(26))
    deck2 = Deck.new(standard_deck)

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = ExecuteGame.new(player1, player2)

    assert game.player1.respond_to?(:has_lost?)
    assert game.player2.respond_to?(:has_lost?)
  end

  def test_it_can_access_player_decks
    standard_deck = CardGenerator.new('lib/cards.txt').cards

    deck1 = Deck.new(standard_deck.pop(26))
    deck2 = Deck.new(standard_deck)

    player1 = Player.new("Megan", deck1)
    player2 = Player.new("Aurora", deck2)

    game = ExecuteGame.new(player1, player2)

    assert game.player1.respond_to?(:deck)
    assert game.player2.respond_to?(:deck)
  end

end
