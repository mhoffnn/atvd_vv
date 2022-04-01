defmodule FizzBuzz do
  def fizz_buzz(value) when value < 1 or value > 100, do: :invalid_value
  def fizz_buzz(value) when rem(value, 15) == 0, do: "FizzBuzz"
  def fizz_buzz(value) when rem(value, 5) == 0, do: "Buzz"
  def fizz_buzz(value) when rem(value, 3) == 0, do: "Fizz"
end
