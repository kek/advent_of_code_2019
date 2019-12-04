defmodule AdventOfCode2019.Day1.Test do
  use ExUnit.Case

  alias AdventOfCode2019.Day1

  test "specification" do
    assert Day1.fuel_required(12) == 2
    assert Day1.fuel_required(14) == 2
    assert Day1.fuel_required(1969) == 654
    assert Day1.fuel_required(100_756) == 33583
  end

  test "solution" do
    result =
      File.read!("priv/day1_input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Enum.map(&Day1.fuel_required/1)
      |> Enum.sum()

    assert result == 3_426_455
  end

  test "part 2" do
    # A module of mass 14 requires 2 fuel. This fuel requires no further fuel (2
    # divided by 3 and rounded down is 0, which would call for a negative fuel),
    # so the total fuel required is still just 2.

    assert Day1.more_fuel_required(14) == 2

    # At first, a module of mass 1969 requires 654 fuel. Then, this fuel
    # requires 216 more fuel (654 / 3 - 2). 216 then requires 70 more fuel,
    # which requires 21 fuel, which requires 5 fuel, which requires no further
    # fuel. So, the total fuel required for a module of mass 1969 is 654 + 216 +
    # 70 + 21 + 5 = 966.

    assert Day1.more_fuel_required(1969) == 966

    # The fuel required by a module of mass 100756 and its fuel is: 33583 +
    # 11192 + 3728 + 1240 + 411 + 135 + 43 + 12 + 2 = 50346.

    assert Day1.more_fuel_required(100_756) == 50346
  end

  test "part 2 solution" do
    result =
      File.read!("priv/day1_input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Enum.map(&Day1.more_fuel_required/1)
      |> Enum.sum()

    assert result == 5_136_807
  end
end
