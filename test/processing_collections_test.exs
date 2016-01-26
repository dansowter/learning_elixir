defmodule ProcessingCollectionsTest do
  use ExUnit.Case

  # Exercise: ListsAndRecursion-5
  # Implement the following MyEnum functions using no library functions or list
  # comprehensions: all?, each, filter, split, and take. You may need to use an
  # if statement to implement filter. The syntax for this is
  #
  # if condition do
  #   expression(s)
  # else
  #   expression(s)
  # end

  test "MyEnum.all?([])" do
    assert MyEnum.all?([]) == Enum.all?([])
  end

  test "MyEnum.all?([1, 2, 3])" do
    assert MyEnum.all?([1, 2, 3]) == Enum.all?([1, 2, 3])
  end

  test "MyEnum.all?([1, nil, 3])" do
    assert MyEnum.all?([1, nil, 3]) == Enum.all?([1, nil, 3])
  end

  test "MyEnum.all?([], &(&1 < 0))" do
    assert MyEnum.all?([], &(&1 < 0)) == Enum.all?([], &(&1 < 0))
  end

  test "MyEnum.all?([1, 2, 3], &(&1 < 0))" do
    assert MyEnum.all?([1, 2, 3], &(&1 < 0)) == Enum.all?([1, 2, 3], &(&1 < 0))
  end

  test "MyEnum.all?([1, nil, 3], &(&1 < 0))" do
    assert MyEnum.all?([1, nil, 3], &(&1 < 0)) == Enum.all?([1, nil, 3], &(&1 < 0))
  end

  test "MyEnum.each/2" do
    assert MyEnum.each([], fn(x) -> x end) == :ok
    assert MyEnum.each([1, 2, 3], fn(x) -> Process.put(:enum_test_each, x * 2) end) == :ok
    assert Process.get(:enum_test_each) == 6
  after
    Process.delete(:enum_test_each)
  end

  test "filter" do
    assert MyEnum.filter([1, 2, 3], fn(x) -> rem(x, 2) == 0 end) == [2]
    assert MyEnum.filter([2, 4, 6], fn(x) -> rem(x, 2) == 0 end) == [2, 4, 6]
  end

  test "flatten" do
    assert MyEnum.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]]) == [1, 2, 3, 4, 5, 6]
  end

  test "Exercise: ListsAndRecursion-7" do
    # In the last exercise of Chapter 7, Lists and Recursion, on page 61, you
    # wrote a span funtion. Use it and list comprehensions to return a list of
    # the prime numbers from 2 to n.

    assert MyList.primes_up_to(10)  == [ 2, 3, 5, 7]
  end

  test "Exercise: ListsAndRecursion-8" do
    # The Pragmatic Bookshelf has offices in Texas (TX) and North Carolina (NC),
    # so we have to charge sales tax on orders shipped to these states. The
    # rates can be expressed as a keyword list

    tax_rates = [ NC: 0.075, TX: 0.08 ]

    # Here’s a list of orders:

    orders = [
      [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 124, ship_to: :OK, net_amount:  35.50 ],
      [ id: 125, ship_to: :TX, net_amount:  24.00 ],
      [ id: 126, ship_to: :TX, net_amount:  44.80 ],
      [ id: 127, ship_to: :NC, net_amount:  25.00 ],
      [ id: 128, ship_to: :MA, net_amount:  10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ id: 120, ship_to: :NC, net_amount:  50.00 ] ]

    # Write a function that takes both lists and returns a copy of the orders,
    # but with an extra field, total_amount, which is the net plus sales tax.
    # If a shipment is not to NC or TX, there’s no tax applied.

    taxed_orders = [
      [id: 123, ship_to: :NC, net_amount: 100.0, total_amount: 107.5],
      [id: 124, ship_to: :OK, net_amount: 35.5,  total_amount: 35.5],
      [id: 125, ship_to: :TX, net_amount: 24.0,  total_amount: 25.92],
      [id: 126, ship_to: :TX, net_amount: 44.8,  total_amount: 48.384],
      [id: 127, ship_to: :NC, net_amount: 25.0,  total_amount: 26.875],
      [id: 128, ship_to: :MA, net_amount: 10.0,  total_amount: 10.0],
      [id: 129, ship_to: :CA, net_amount: 102.0, total_amount: 102.0],
      [id: 120, ship_to: :NC, net_amount: 50.0,  total_amount: 53.75]]

    calculate_tax = fn orders, rates ->
      for order <- orders do
        [id: _, ship_to: ship_to, net_amount: net_amount] = order
        rate = rates |> Dict.get(ship_to, 0)

        order ++ [{:total_amount, net_amount * (1 + rate)}]
      end
    end

    assert calculate_tax.(orders, tax_rates) == taxed_orders
  end
end
