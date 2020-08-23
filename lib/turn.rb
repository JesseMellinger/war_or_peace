class Turn
  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    case
    when player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0) then
    :basic
    when (player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
    player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)) then
    :mutually_assured_destruction
    when player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) then
    :war
    end
  end

  def winner
    case type()
    when :basic then player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
    when :war then player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) ? player1 : player2
    when :mutually_assured_destruction then "No Winner"
    end
  end

  def pile_cards
    if type() == :basic
      @spoils_of_war.push(player1.deck.remove_card)
      @spoils_of_war.push(player2.deck.remove_card)
    elsif type() == :war
      3.times{@spoils_of_war.push(player1.deck.remove_card)}
      3.times{@spoils_of_war.push(player2.deck.remove_card)}
    elsif type() == :mutually_assured_destruction
      3.times{player1.deck.remove_card}
      3.times{player2.deck.remove_card}
    end
  end

  def award_spoils(winner)
    @spoils_of_war.each do |card|
    winner.deck.cards << card
    end
  end

end
