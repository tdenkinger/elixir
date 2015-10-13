defmodule Ch3ExRange do
  def range(min, max) do
    compile_list([], min, max)
  end
end

defmodule Ch3ExListLen do
  def list_len(list) do
    length(0, list)
  end

  defp length(count, []) do
    count
  end

  defp length(count, [_ | tail]) do
    length(count + 1, tail)
  end
end

