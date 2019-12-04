defmodule AdventOfCode2019.Day1 do
  def fuel_required(mass) do
    floor(mass / 3) - 2
  end
end
