defmodule ElixirBasicsTests do
  use ExUnit.Case

  test "list concatenation" do
    my_list = [1,2] ++ [3,4]

    assert my_list == [1,2,3,4]
    assert 4 in my_list
  end

  test "list difference" do
    my_list = [1,2] -- [1,3]

    assert my_list == [2]
  end
end
