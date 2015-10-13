defmodule Fraction do
  defstruct a: nil, b: nil

  def new(a, b) do
    %Fraction{a: a, b: b}
  end

  def value(fraction) do
    fraction.a / fraction.b
  end

  def add(fraction1, fraction2) do
    new(fraction1.a * fraction2.b + fraction2.a * fraction1.b,
        fraction2.b * fraction1.b
       )
  end

end
