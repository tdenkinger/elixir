todo_list = [
  {1, %{date: {2015, 12, 1}, title: "Dentis"}},
  {2, %{date: {2015, 12, 2}, title: "Poop"}},
  {3, %{date: {2015, 12, 3}, title: "Bebop"}}
] |> Enum.into(HashDict.new)
