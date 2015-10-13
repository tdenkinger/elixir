defmodule MultiDict do
  def new, do: HashDict.new

  def add(dict, key, value) do
    HashDict.update(dict, key, [value],
                    &[value | &1])
                    # fn(titles) -> [title | titles] end
  end

  def get(dict, key) do
    HashDict.get(dict, key, [])
  end
end

defmodule TodoList do
  def new, do: MultiDict.new

  def add_entry(todo_list, date, title) do
    MultiDict.add(todo_list, date, title)
  end

  def entries(todo_list, date) do
    MultiDict.get(todo_list, date)
  end
end