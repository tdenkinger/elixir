defmodule Game do
  def guess(actual, range) do
    guess(actual, range, 0)
  end

  def guess(actual, _, guess) when actual == guess do
    IO.puts "You got it: #{guess}"
  end

  def guess(actual, range, _) do
    low..high = range

    guess = low + div(high - low, 2)
    IO.puts "My guess: #{guess}"

    new_range = get_new_range(actual, range, guess)
    guess(actual, new_range, guess)
  end

  defp get_new_range(actual, range, guess) when guess > actual do
    first.._ = range
    first..(guess-1)
  end

  defp get_new_range(_, range, guess) do
    _..last = range
    (guess+1)..last
  end

end
