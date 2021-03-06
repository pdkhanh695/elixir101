defmodule Cards do 

  @moduledoc """
    Provides methods for creating and handling a deck of cards 
  """

  @doc """
    Returns a list of strings resprenting a deck of playing cards 
  """
  def create_toplist do 
    values = ["Hanoi Univ", "Danang Univ", "Bachkhoa Univ"]
    suits_location = ["Hanoi", "Hue", "HaiPhong", "Nghe An", "DaNang", "Hue", "Tp.HCM"]

    # for value <- values do 
    #   "fucking shit"
    # end 

    # for suit_location <- suits_location do 
    #   "fucking suit location"
    # end 
    for value <- values, suit_location <- suits_location do 
      "fucking man"
    end
  end 

  def create_deck do 
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for suit <- suits, value <- values do 
        "#{value} of #{suit}"
    end
  end 
  def shuffle(deck) do 
    Enum.shuffle(deck)
  end

  @doc """
    Determine 

    ## Examples 

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, card) do 
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck. The hand_sized ....

    ## Examples
      iex> deck = Cards.create_deck 
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """


  def deal(deck, hand_size) do 
    Enum.split(deck, hand_size)
  end 

  def save(deck, filename) do 
    binary = :erlang.term_to_binary(deck) 
    File.write(filename, binary)
  end

  def load(filename) do 
    case File.read(filename) do 
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "error code"
    end
  end 

  def create_hand(hand_size) do 
    deck = Cards.create_deck 
    deck = Cards.shuffle(deck) 
    hand = Cards.deal(deck, hand_size)

    Cards.create_deck 
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
