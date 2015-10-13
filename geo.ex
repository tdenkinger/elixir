defmodule Geometry do
  def area({:rectangle, a, b}) do
    a * b
  end

  def area({:square, a}) do
    area({:rectangle, a, a})
  end

  def area({:circle, r}) do
    r * r * 3.1415
  end

  def area(unknown) do
    {:error, {:unknown_shape, unknown}}
  end
end

