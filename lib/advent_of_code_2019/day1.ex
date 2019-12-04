defmodule AdventOfCode2019.Day1 do
  def fuel_required(mass) do
    case floor(mass / 3) - 2 do
      n when n < 0 -> 0
      n -> n
    end
  end

  # So, for each module mass, calculate its fuel and add it to the total. Then,
  # treat the fuel amount you just calculated as the input mass and repeat the
  # process, continuing until a fuel requirement is zero or negative.
  def more_fuel_required(0), do: 0
  def more_fuel_required(mass) when mass < 0, do: 0

  def more_fuel_required(mass) do
    fuel_for_mass =
      case floor(mass / 3) - 2 do
        n when n < 0 -> 0
        n -> n
      end

    fuel_for_fuel = more_fuel_required(fuel_for_mass)
    fuel_for_mass + fuel_for_fuel
  end
end
