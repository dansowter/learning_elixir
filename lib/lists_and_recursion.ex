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

  def max([ max ]) do
    max
  end

  def max([ max, head | tail ]) when max > head do
    max([ max | tail ])
  end

  def max([ _max, head | tail ]) do
    max([ head | tail ])
  end

  def span(a, b) when b < a do
    []
  end

  def span(a, b) do
    a..b
    |> Enum.map(&(&1))
  end
end
