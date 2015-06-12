defmodule MyList do
  def len(list), do: _len(list, 0)
  def sum(list), do: _sum(list)

  def map([], _func),           do: []
  def map([head | tail], func), do: [ func.(head) | map(tail, func) ]

  def reduce([], value, _), do: value
  def reduce([head | tail], value, func), do: reduce(tail, func.(head, value), func)

  defp _len([], length),         do: length
  defp _len([_ | tail], length), do: _len(tail, length+1)

  defp _sum([]), do: 0
  defp _sum([head | tail]), do: head + _sum(tail)
end
