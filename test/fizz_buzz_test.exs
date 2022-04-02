##AS7
defmodule FizzBuzzTest do
  use ExUnit.Case
  doctest FizzBuzz

  test "invalid value smaller then 1" do
    assert FizzBuzz.fizz_buzz(0) == :invalid_value
  end

  test "invalid value bigger then 100" do
    assert FizzBuzz.fizz_buzz(101) == :invalid_value
  end

  test "case value divisible by 3" do
    assert FizzBuzz.fizz_buzz(3) == "Fizz"
  end

  test "case value divisible by 5" do
    assert FizzBuzz.fizz_buzz(5) == "Buzz"
  end

  test "case value divisible by 3 and 5" do
    assert FizzBuzz.fizz_buzz(15) == "FizzBuzz"
  end
end
