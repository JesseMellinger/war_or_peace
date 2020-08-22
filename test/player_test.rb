require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'

class PlayerTest < Minitest::Test

  def test_player_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    assert_instance_of Player, player
  end

  def test_get_player_name
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    assert_equal "Clarisa", player.name
  end

  def test_get_player_deck
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    assert_equal 3, player.deck.cards.length
    assert player.deck.cards.all? {|card| card.instance_of? Card}
  end

  def test_remove_first_card_from_deck_of_player
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    first_card_from_deck = player.deck.remove_card

    assert_equal 12, first_card_from_deck.rank
    assert_equal :diamond, first_card_from_deck.suit
    assert_equal "Queen", first_card_from_deck.value
  end

  def test_player_loses_when_out_of_cards
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)

    deck = Deck.new([card1, card2, card3])

    player = Player.new('Clarisa', deck)

    refute player.has_lost?

    player.deck.remove_card

    refute player.has_lost?

    player.deck.remove_card

    refute player.has_lost?

    player.deck.remove_card

    assert player.has_lost?
    assert_equal 0, player.deck.cards.length
  end

end
