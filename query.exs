people = [
  %{ name: "Grumpy",    height: 1.05 },
  %{ name: "Dave",      height: 1.35 },
  %{ name: "Dopey",     height: 0.95 },
  %{ name: "Shaquille", height: 2.16 },
  %{ name: "Sneezy",    height: 2.25 }
]

for person = %{ height: height } <- people,
  height > 1.5,
  do: IO.inspect person
