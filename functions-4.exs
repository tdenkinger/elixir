prefixer = fn prefix ->
  fn name -> IO.puts("#{prefix} #{name}") end
end

doc = prefixer.("Doctor")
doc.("Kildare")

count = prefixer.("Count")
count.("Dracula")
