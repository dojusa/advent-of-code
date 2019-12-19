defmodule AOC.Y2019.D01 do
  def part_1(input) do
    calculate_required_fuel(input, &module_fuel/1)
  end

  def part_2(input) do
    calculate_required_fuel(input, &total_module_fuel/1)
  end

  def calculate_required_fuel(input, calculator) do
    input
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.reduce(0, fn line, total_fuel ->
      mass = String.to_integer(line)
      total_fuel + calculator.(mass)
    end)
  end

  defp module_fuel(mass), do: div(mass, 3) - 2

  defp total_module_fuel(mass, total \\ 0) do
    fuel = module_fuel(mass)

    if fuel > 0 do
      total = total + fuel
      total_module_fuel(fuel, total)
    else
      total
    end
  end
end
