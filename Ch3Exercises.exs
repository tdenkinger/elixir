defmodule Ch3Ex do
  def line_lengths!(path) do
    prepare_file(path)
    |> Stream.map(&{&1, String.length(&1)})
    |> Enum.each( fn({word, len}) -> IO.puts "#{len}: #{word}" end )
  end

  def longest_line_length!(path) do
    prepare_file(path)
    |> Stream.map(&String.length(&1))
    |> Enum.reduce(0, &max/2)
  end

  def longest_line!(path) do
    prepare_file(path)
    |> Enum.reduce("", &longer_line/2)
  end

  defp longer_line(line1, line2) do
    if String.length(line1) > String.length(line2) do
      line1
    else
      line2
    end
  end

  defp prepare_file(path) do
    File.stream!(path)
    |> Stream.map(&String.replace(&1, "\n", ""))
  end
end
