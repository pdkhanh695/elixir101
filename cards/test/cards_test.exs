defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck make 20 cards" do 
    deck_length = length(Cards.create_deck) 
    assert deck_length == 20
  end

  test "shuffling a deck randomizes it" do 
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck) 
  end

  test "deal a deck" do 
    deck = Cards.create_deck
    deck_shuffle = Cards.shuffle(deck) 
    Cards.deal(deck_shuffle, 2)
  end
end
