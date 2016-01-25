defmodule Times do
  def double(n) do
    n * 2
  end

  def triple(n) do
    n * 3
  end

  def quadruple(n) do
    double(n) * 2
  end
end

defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n - 1)
end

defmodule Sum do
  def up_to(0), do: 0
  def up_to(n), do: up_to(n - 1) + n
end

defmodule GCD do
  def of(x, 0), do: x

  def of(x, y) do
    if !is_integer(x) || !is_integer(y) || x < 0 || y < 0 do
      raise ArgumentError, message: "positive integers required"
    end

    of(y, rem(x, y))
  end
end

defmodule Chop do
  def guess(secret, low..high) do
    next = div(high + low, 2)

    is_it("", next, secret, low..high)
  end

  def is_it(reply, current, secret, _..high) when current < secret do
    reply = reply <> "Is it #{current}\n"
    low = current + 1
    next = div(high + low, 2)

    is_it(reply, next, secret, low..high)
  end

  def is_it(reply, current, secret, low.._) when current > secret do
    reply = reply <> "Is it #{current}\n"
    high = current - 1
    next = div(high + low, 2)

    is_it(reply, next, secret, low..high)
  end

  def is_it(reply, current, secret, _) when current == secret do
    reply <> "Is it #{secret}\n#{secret}\n"
  end
end
