defmodule AdventOfCode2019.Day2.Test do
  use ExUnit.Case
  alias AdventOfCode2019.Day2

  describe "part 1" do
    test "example program 1" do
      initial = {[1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50], 0}
      middle = {[1, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50], 4}
      middle2 = {[3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50], 8}
      final = {[3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50], -1}
      assert Day2.step(initial) == middle
      assert Day2.step(middle) == middle2
      assert Day2.step(middle2) == final
      assert Day2.run(initial) == final
    end

    test "1,0,0,0,99 becomes 2,0,0,0,99 (1 + 1 = 2)." do
      assert Day2.run({[1, 0, 0, 0, 99], 0}) == {[2, 0, 0, 0, 99], -1}
    end

    test "2,3,0,3,99 becomes 2,3,0,6,99 (3 * 2 = 6)." do
      assert Day2.run({[2, 3, 0, 3, 99], 0}) == {[2, 3, 0, 6, 99], -1}
    end

    test "2,4,4,5,99,0 becomes 2,4,4,5,99,9801 (99 * 99 = 9801)." do
      assert Day2.run({[2, 4, 4, 5, 99, 0], 0}) == {[2, 4, 4, 5, 99, 9801], -1}
    end

    test "1,1,1,4,99,5,6,0,99 becomes 30,1,1,4,2,5,6,0,99." do
      assert Day2.run({[1, 1, 1, 4, 99, 5, 6, 0, 99], 0}) == {[30, 1, 1, 4, 2, 5, 6, 0, 99], -1}
    end

    test "solution" do
      program =
        "priv/day2_input.txt"
        |> File.read!()
        |> String.split(",", trim: true)
        |> Enum.map(&String.to_integer/1)
        |> Day2.update_program(12, 2)

      {result, -1} = Day2.run({program, 0})
      assert Enum.at(result, 0) == 2_782_414
    end
  end
end
