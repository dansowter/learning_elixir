defmodule MyList do
  def sum([]), do: 0
  def sum([ total ]), do: total
  def sum([ total, head | tail ]) do
    sum([ total + head | tail ])
  end

  def mapsum(list, func) do
    list
    |> Enum.map(func)
    |> sum
  end

  def max([]) do
    nil
  end

  def max(collection) do
    Enum.max collection
  end

  def span(a, b) when b < a do
    []
  end

  def span(a, b) do
    Enum.to_list a..b
  end

  def primes_up_to(n) do
    range = span(2, n)
    range -- (for a <- range, b <- range, a <= b, a*b <= n, do: a * b)
  end
end
