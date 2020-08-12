require 'minitest/autorun'
require 'minitest/pride'
require '../lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_card_generator_exists
    filename = 'cards.txt'
    standard_deck = CardGenerator.new(filename)

    assert_instance_of CardGenerator, standard_deck
  end

  def test_cards_array_initialized_empty
    filename = 'cards.txt'
    standard_deck = CardGenerator.new(filename)

    assert standard_deck.cards.empty?
  end

  def test_

  end

end
