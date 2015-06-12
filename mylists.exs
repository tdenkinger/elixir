defmodule MyList do
  def len(list), do: _len(list, 0)
  def sum(list), do: _sum(list)
  def reduce(list, start, func), do: _reduce(list, start, func)

  def map([], _func),           do: []
  def map([head | tail], func), do: [ func.(head) | map(tail, func) ]

  def mapsum(list, func), do: map(list, func) |> sum(&1)

  # private

  defp _reduce([], value, _), do: value
  defp _reduce([head | tail], value, func), do: _reduce(tail, func.(head, value), func)

  defp _len([], length),         do: length
  defp _len([_ | tail], length), do: _len(tail, length+1)

  defp _sum([]), do: 0
  defp _sum([head | tail]), do: head + _sum(tail)
end
