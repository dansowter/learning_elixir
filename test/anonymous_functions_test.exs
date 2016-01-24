defmodule AnonymousFunctionsTest do
  use ExUnit.Case

  test "basic anonymous functions" do
    my_function = fn a, b ->
       a + (2 * b)
    end

    assert my_function.(3,5) == 13
    assert_raise(BadArityError, fn ->
       my_function.()
    end)
    assert_raise(BadArityError, fn ->
       my_function.(1,2,3)
    end)
  end

  test "list_concat" do
    list_concat = fn list1, list2 ->
       list1 ++ list2
    end

    assert list_concat.([:a, :b], [:c, :d]) == [:a, :b, :c, :d]
  end

  test "sum" do
    sum = fn a, b, c ->
      a + b + c
    end

    assert sum.(1, 2, 3) == 6
  end

  test "pair_tuple_to_list" do
    pair_tuple_to_list = fn {a, b} ->
      [a, b]
    end

    assert pair_tuple_to_list.( { 1234, 5678 } ) == [ 1234, 5678 ]
  end

  setup do
    fizz_buzz = fn
      (0, 0, _) -> "FizzBuzz"
      (0, _, _) -> "Fizz"
      (_, 0, _) -> "Buzz"
      (_, _, a) -> a
    end
    {:ok, [fizz_buzz: fizz_buzz]}
  end

  test "Exercise: Functions-2", %{fizz_buzz: fizz_buzz} do
    # Write a function that takes three arguments.
    # If the first two are zero, return “FizzBuzz.”
    # If the first is zero, return “Fizz.”
    # If the second is zero, return “Buzz.”
    # Otherwise return the third argument.
    # Do not use any language features that we haven’t yet covered in this book.

    assert fizz_buzz.(0, 0, "Whatever") == "FizzBuzz"
    assert fizz_buzz.(0, 123, "Apple") == "Fizz"
    assert fizz_buzz.("Hello", 0, 27) == "Buzz"
    assert fizz_buzz.(:ok, "Foo", 42) == 42
  end

  test "Exercise: Functions-3", %{fizz_buzz: fizz_buzz} do
    # The operator rem(a, b) returns the remainder after dividing a by b.
    # Write a function that takes a single integer (n) and calls the function
    # in the previous exercise, passing it rem(n,3), rem(n,5), and n.
    # Call it seven times with the arguments 10, 11, 12, and so on.
    # You should get “Buzz, 11, Fizz, 13, 14, FizzBuzz, 16.”

    game = fn n ->
      fizz_buzz.(rem(n,3), rem(n,5), n)
    end

    assert game.(10) == "Buzz"
    assert game.(11) == 11
    assert game.(12) == "Fizz"
    assert game.(13) == 13
    assert game.(14) == 14
    assert game.(15) == "FizzBuzz"
    assert game.(16) == 16
  end
end
