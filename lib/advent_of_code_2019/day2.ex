defmodule AdventOfCode2019.Day2 do
  def step({program, pc}) do
    case Enum.drop(program, pc) do
      [1, left, right, destination | _] ->
        augend = Enum.at(program, left)
        addend = Enum.at(program, right)
        sum = augend + addend
        program = List.replace_at(program, destination, sum)
        {program, pc + 4}

      [2, left, right, destination | _] ->
        multiplicand = Enum.at(program, left)
        multiplier = Enum.at(program, right)
        product = multiplicand * multiplier
        program = List.replace_at(program, destination, product)
        {program, pc + 4}

      [99 | _] ->
        {program, -1}
    end
  end

  def run({program, -1}) do
    {program, -1}
  end

  def run({program, pc}) do
    {program, pc}
    |> step()
    |> run()
  end

  def update_program(program, noun, verb) do
    program
    |> List.replace_at(1, noun)
    |> List.replace_at(2, verb)
  end
end
