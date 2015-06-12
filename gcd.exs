defmodule GCD do
  def of(_, 0), do: 0
  def of(x, y), do: rem(x, y)
end
