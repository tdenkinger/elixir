defmodule TestNum do
  def test(x) when x < 0, do: :negative
  def test(0),            do: :zero
  def test(x) when x > 0, do: :positive
end