fizzbuzz = fn
  0, 0, _ -> IO.puts("FizzBuzz")
  0, _, _ -> IO.puts("Fizz")
  _, 0, _ -> IO.puts("Buzz")
  _, _, c -> IO.puts("#{c}")
end

fizzbuzz.(0, 0, 9)
fizzbuzz.(0, 9, 9)
fizzbuzz.(9, 0, 9)
fizzbuzz.(9, 9, 9)
