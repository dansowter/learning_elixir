defmodule PatternMatchingTest do
  use ExUnit.Case

  test "matching values" do
    [a: x] = [a: 123]

    assert x == 123
  end

  test "matching lists" do
    list = [head | _tail] = [1, 2, 3]

    [_a,b,_c] = list

    assert head == 1
    assert list == [1,2,3]
    assert b == 2
  end

  test "matching exercise 1" do
    a = [1,2,3]

    assert a == [1,2,3]

    a = 4
    4 = a

    assert a == 4

    # Won't match
    # [a,b]=[1,2,3]

    a = [[1,2,3]]

    assert a == [[1,2,3]]

    [a] = [[1,2,3]]

    assert a == [1,2,3]

    # Won't match
    # [[a]] = [[1,2,3]]
  end

  test "Exercise: PatternMatching-2" do
    # Which of the following will match?
    # – [a,b,a]=[1,2,3] – [a,b,a]=[1,1,2] – [a,b,a]=[1,2,1]

    # match = fn ->
    #   [a,b,a] = [1,2,3]
    # end
    # assert_raise(MatchError, match)
    #
    # match = fn ->
    #   [a,b,a]=[1,1,2]
    # end
    # assert_raise(MatchError, match)

    [a,b,a]=[1,2,1]
    assert a == 1
    assert b == 2
  end

  test "Exercise: PatternMatching-3" do
    # If you assume the variable a initially contains the value 2,
    # which of the following will match?
    # – [a,b,a]=[1,2,3]
    # – [a,b,a]=[1,1,2]
    # – a=1
    # # use existing value of a
    # – ^a = 2
    # – ^a = 1
    # – ^a=2-a

    # MatchError tests pass. Commented to avoid compiler warnings.
    # a = 2
    # match = fn ->
    #   [a,b,a]=[1,2,3]
    # end
    # assert_raise(MatchError, match)

    # a = 2
    # match = fn ->
    #   [a,b,a]=[1,1,2]
    # end
    # assert_raise(MatchError, match)

    # a = 2
    a = 1
    assert a == 1

    a = 2
    ^a = 2
    assert a == 2

    # a = 2
    # match = fn ->
    #   ^a = 1
    # end
    # assert_raise(MatchError, match)

    # a = 2
    # match = fn ->
    #   ^a = 2 - a
    # end
    # assert_raise(MatchError, match)
  end
end
