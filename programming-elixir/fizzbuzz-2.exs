fizzbuzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, x) -> x
end

run = fn
  (n) -> fizzbuzz.(rem(n,3), rem(n,5), n)
end

IO.puts run.(10)
IO.puts run.(11)
IO.puts run.(12)
IO.puts run.(13)
IO.puts run.(14)
IO.puts run.(15)
IO.puts run.(16)
IO.puts run.(17)
