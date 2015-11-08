defmodule Fraction do
  defstruct a: nil, b: nil

  def new(a, b) do
    %Fraction{a: a, b: b}
  end

  def add(f1, f2) do
    new(f1.a * f2.b + f2.a * f1.b, f1.b * f2.b)
  end

  def value(fraction) do
    fraction.a / fraction.b
  end

  def to_s(fraction) do
    IO.puts "#{fraction.a} over #{fraction.b}"
  end
end
