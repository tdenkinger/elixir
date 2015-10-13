defmodule Ch3Ex do
  def line_lengths!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(&{&1, String.length(&1)})
    |> Enum.each(
      fn({word, len}) ->
        IO.puts "#{len}: #{word}"
      end
      )
  end

  def longest_line_length!(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
    |> Stream.map(&String.length(&1))
    |> Enum.each(
      fn(_) -> 0
      end
      )
  end
end
