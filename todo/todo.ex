defmodule TodoList do
  defstruct auto_id: 1, entries: HashDict.new

  def new(entries \\ []) do
    Enum.reduce(
      entries,
      %TodoList{},
      &add_entry(&2, &1)
    )
  end

  def add_entry(
    %TodoList{entries: entries, auto_id: auto_id} = todo_list, entry ) do

    entry = Map.put(entry, :id, auto_id)
    new_entries = HashDict.put(entries, auto_id, entry)

    %TodoList{ todo_list |
      entries: new_entries, auto_id: auto_id + 1
    }
  end

  def entries(%TodoList{entries: entries}, date) do
    entries
    |> Stream.filter( fn({_, entry}) -> entry.date == date end )
    |> Enum.map(      fn({_, entry}) -> entry end )
  end

  def update_entry(
    %TodoList{entries: entries} = todo_list, entry_id, updater_fun
  ) do
    case entries[entry_id] do
      nil -> todo_list
      old_entry ->
        new_entry = updater_fun.(old_entry)
        new_entries = HashDict.put(entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end

  def delete_entry(%TodoList{entries: entries}, id) do
    HashDict.delete(entries, id)
  end
end

defmodule TodoList.CsvImporter do
  def import(file_path) do
    file_path
    |> read_lines
    |> create_entries
    |> TodoList.new
  end

  def create_entries(lines) do
    lines
    |> Stream.map(&extract_fields/1)
    |> Stream.map(&create_entry/1)
  end

  def create_entry({date, title}) do
    %{date: date, title: title}
  end

  def extract_fields(line) do
    line
    |> String.split(",")
    |> convert_date
  end

  def convert_date([date_string, title]) do
    {parse_date(date_string), title}
  end

  def parse_date(date_string) do
    date_string
    |> String.split("/")
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end

  defp read_lines(file_path) do
    file_path
    |> File.stream!
    |> Stream.map(&String.replace(&1, "\n", ""))
  end
end

defimpl Collectable, for: TodoList do
  def into(original) do
    {original, &into_callback/2}
  end

  defp into_callback(todo_list, {:cont, entry}) do
    TodoList.add_entry(todo_list, entry)
  end

  defp into_callback(todo_list, :done), do: todo_list
  defp into_callback(todo_list, :halt), do: :ok
end


