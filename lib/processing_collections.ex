defmodule MyEnum do
  def all?(collection, func \\ &(&1))
  def all?([], _), do: true
  def all?([head | tail], func) do
    !!(func.(head) && all?(tail, func))
  end

  def each([], _), do: :ok
  def each([head | tail], func) do
    func.(head)
    each tail, func
  end

  def filter([], _), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head] ++ filter(tail, func)
    else
      filter(tail, func)
    end
  end

  def flatten([]), do: []
  def flatten([head | tail]) do
    if is_list(head) do
      flatten(head) ++ flatten(tail)
    else
      [head] ++ flatten(tail)
    end
  end
end
