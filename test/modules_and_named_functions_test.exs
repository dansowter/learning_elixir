defmodule ModulesAndNamedFunctionsTest do
  use ExUnit.Case

  test "Times.double/1" do
    assert Times.double(1) == 2
    assert Times.double(0) == 0
    assert Times.double(-5) == -10
  end

  test "Times.triple/1" do
    assert Times.triple(1) == 3
    assert Times.triple(0) == 0
    assert Times.triple(-5) == -15
  end

  test "Times.quadruple/1" do
    assert Times.quadruple(10) == 40
    assert Times.quadruple(0) == 0
    assert Times.quadruple(-5) == -20
  end

  test "Sum.up_to/1" do
    assert Sum.up_to(0) == 0
    assert Sum.up_to(3) == 6
    assert Sum.up_to(10) == 55
  end

  test "GCD.of/2" do
    assert GCD.of(3, 0) == 3
    assert GCD.of(10, 4) == 2

    assert_raise(ArgumentError, "positive integers required", fn ->
      GCD.of(-1, 2)
    end)

    assert_raise(ArgumentError, "positive integers required", fn ->
      GCD.of(0.5, 1)
    end)

    assert_raise(ArgumentError, "positive integers required", fn ->
      GCD.of("Hello", :atom)
    end)
  end

  test "Exercise: ModulesAndFunctions-6" do
    # I’m thinking of a number between 1 and 1000....
    # The most efficient way to find the number is to guess halfway between the low
    # and high numbers of the range. If our guess is too big, then the answer lies
    # between the bottom of the range and one less than our guess. If our guess is
    # too small, then the answer lies between one more than our guess and the end of
    # the range.
    #
    # Your API will be guess(actual, range), where range is an Elixir range.
    #
    # Your output should look similar to this:
    #     iex> Chop.guess(273, 1..1000)
    #     Is it 500
    #     Is it 250
    #     Is it 375
    #     Is it 312
    #     Is it 281
    #     Is it 265
    #     Is it 273
    #     273
    # Hints:
    # – You may need to implement helper functions with an additional parameter (the currently guessed number).
    # – The div(a,b) function performs integer division.
    # – Guard clauses are your friends.
    # – Patterns can match the low and high parts of a range (a..b=4..8).

    result = Chop.guess(273, 1..1000)

    assert Regex.match?(~r{^Is it 500}m, result)
    assert Regex.match?(~r{^Is it 250}m, result)
    assert Regex.match?(~r{^Is it 375}m, result)
    assert Regex.match?(~r{^Is it 312}m, result)
    assert Regex.match?(~r{^Is it 281}m, result)
    assert Regex.match?(~r{^Is it 265}m, result)
    assert Regex.match?(~r{^Is it 273}m, result)
    assert Regex.match?(~r{^273}m, result)
  end

  test "Exercise: ModulesAndFunctions-7" do
    # – Get the value of an operating-system environment variable. (Elixir)
    # – Return the extension component of a file name (so return .exs if given
    # "dave/test.exs"). (Elixir)
    # – Return the process’s current working directory. (Elixir)
    # – Convert a string containing JSON into Elixir data structures.
    # – Execute a command in your operating system’s shell.

    assert System.get_env["PATH"] |> String.length != 0
    assert Path.extname("test_helper.exs") == ".exs"

    {:ok, working_directory } = File.cwd
    assert working_directory |> String.length != 0

    assert "{ \"foo\": \"bar\" }" |> Poison.Parser.parse == {:ok, %{"foo" => "bar"}}
    assert System.cmd("echo", ["Hello, world"]) == {"Hello, world\n", 0}
  end
end
