fizzbuzz = fn
  0, 0, _ -> IO.puts("FizzBuzz")
  0, _, _ -> IO.puts("Fizz")
  _, 0, _ -> IO.puts("Buzz")
  _, _, c -> IO.puts("#{c}")
end

fizzrunner = fn
  n -> fizzbuzz.( rem(n,3), rem(n,5), n )
end

fizzrunner.(10)
fizzrunner.(11)
fizzrunner.(12)
fizzrunner.(13)
fizzrunner.(14)
fizzrunner.(15)
fizzrunner.(16)
