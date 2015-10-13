defmodule Lines do
  defp filtered_file(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
  end

  def large_lines!(path) do
    filtered_file(path)
    |> Enum.filter(&(String.length(&1) > 22))
  end

  def lines_lengths!(path) do
    filtered_file(path)
    |> Enum.map(&String.length/1)
  end

  def longest_line_length!(path) do
    filtered_file(path)
    |> Enum.map(&String.length/1)
    |> Enum.max
  end

  def longest_line!(path) do
    filtered_file(path)
    |> Enum.reduce("", &longer_line/2)
  end

  defp longer_line(line1, line2) do
    if String.length(line1) > String.length(line2) do
      line1
    else
      line2
    end
  end
end
