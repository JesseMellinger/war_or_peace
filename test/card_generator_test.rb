require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card_generator'


class CardGeneratorTest < Minitest::Test

  def test_card_generator_exists
    filename = 'cards.txt'
    standard_deck = CardGenerator.new(filename)

    assert_instance_of CardGenerator, standard_deck
  end

  def test_get_shuffled_deck
    filename = '../lib/cards.txt'
    standard_deck = CardGenerator.new(filename)

    assert_equal 52, standard_deck.cards.count
    assert standard_deck.cards.all? {|card| card.instance_of? Card}
  end

end
