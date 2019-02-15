require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    deck = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        deck << Card.new(suit,value)
      end
    end
    deck
  end

  def initialize(cards = Deck.all_cards)
    @deck = cards
  end

  # Returns the number of cards in the deck.
  def count
    @deck.length
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise "not enough cards" if n > count 
    @deck.shift(n) if n<=count
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    cards.each do |card|
      @deck.push(card)
    end
  end
end
