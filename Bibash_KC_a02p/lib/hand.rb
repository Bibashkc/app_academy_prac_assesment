class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    cards = Hand.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    sum = 0
   cards.each do |card|
    if card.value == :ace && sum > 11
      sum += 1
    end
    if card.value == :ace && sum < 11
      sum += 11
    end
    sum += Card::VALUE_STRINGS[card.value].to_i
   end
   sum
  end

  def busted?
    points>21
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards.concat(deck.take(1))
  end

  def beats?(other_hand) 
    return false if self.busted? 
    self.points > other_hand.points 
  end

  def return_cards(deck)
    deck.return(cards)
    until cards.empty?
      cards.shift
    end
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
