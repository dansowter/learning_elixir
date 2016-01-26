defmodule ListsAndRecursionTest do
  use ExUnit.Case

  # Exercise: ListsAndRecursion-0
  # I defined our sum function to carry a partial total as a second parameter so
  # I could illustrate how to use accumulators to build values. The sum function
  # can also be written without an accumulator. Can you do it?

  test "MyList.sum([])" do
    assert MyList.sum([]) == 0
  end

  test "MyList.sum([10])" do
    assert MyList.sum([10]) == 10
  end

  test "MyList.sum([1, 2, 3, 4, 5])" do
    assert MyList.sum([1, 2, 3, 4, 5]) == 15
  end

  # Exercise: ListsAndRecursion-1
  # Write a mapsum function that takes a list and a function. It applies the function to each element of the list and then sums the result, so
  # iex> MyList.mapsum [1, 2, 3], &(&1 * &1) 14

  test "MyList.mapsum([1, 2, 3], &(&1))" do
    assert MyList.mapsum([1, 2, 3], &(&1)) == 6
  end

  test "MyList.mapsum([], &(&1 * &1))" do
    assert MyList.mapsum([], &(&1 * &1)) == 0
  end

  test "MyList.mapsum([7], &(&1 * &1))" do
    assert MyList.mapsum([7], &(&1 * &1)) == 49
  end

  test "MyList.mapsum([1, 2, 3], &(&1 * &1))" do
    assert MyList.mapsum([1, 2, 3], &(&1 * &1)) == 14
  end

  # Exercise: ListsAndRecursion-2
  # Write a max(list) that returns the element with the maximum value in the
  # list. (This is slightly trickier than it sounds.)

  test "MyList.max([])" do
    assert MyList.max([]) == nil
  end

  test "MyList.max([5])" do
    assert MyList.max([5]) == 5
  end

  test "MyList.max([5, 7, 2, 9, 1])" do
    assert MyList.max([5, 7, 2, 9, 1]) == 9
  end

  # Exercise: ListsAndRecursion-4
  # Write a function MyList.span(from, to) that returns a list of the numbers
  # from from up to to.

  test "MyList.span(1, 1)" do
    assert MyList.span(1, 1) == [1]
  end

  test "MyList.span(1, -1)" do
    assert MyList.span(1, -1) == []
  end

  test "MyList.span(1, 5)" do
    assert MyList.span(1, 5) == [1, 2, 3, 4, 5]
  end
end
