class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if cards[index] == nil
      cards[-1].rank
    else
      cards[index].rank
    end
  end

  def high_ranking_cards
    cards.find_all do |card|
      card.rank >= 11
    end
  end

  def percent_high_ranking
    (100 * (high_ranking_cards.count / cards.length.to_f)).round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards.push(card)
  end

end
