require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'


class CardGeneratorTest < Minitest::Test

  def test_card_generator_exists
    filename = './lib/cards.txt'
    standard_deck = CardGenerator.new(filename)

    assert_instance_of CardGenerator, standard_deck
  end

  def test_get_shuffled_deck
    filename = './lib/cards.txt'
    standard_deck = CardGenerator.new(filename)

    assert_equal 52, standard_deck.cards.count
    assert standard_deck.cards.all? {|card| card.instance_of? Card}
  end

  def test_it_can_access_suit_of_all_cards
    filename = './lib/cards.txt'
    standard_deck = CardGenerator.new(filename)

    assert standard_deck.cards.all? {|card| card.respond_to?(:suit)}
  end

  def test_it_can_access_value_of_all_cards
    filename = './lib/cards.txt'
    standard_deck = CardGenerator.new(filename)

    assert standard_deck.cards.all? {|card| card.respond_to?(:value)}
  end

end
