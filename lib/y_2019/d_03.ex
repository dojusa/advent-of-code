defmodule AOC.Y2019.D03 do
  def part_1(input) do
    [wire1, wire2] =
      input
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, ",", trim: true))
      |> Enum.map(&get_paths/1)
      |> Enum.map(&draw_paths/1)

    wire1
    |> MapSet.intersection(wire2)
    |> Enum.map(fn {p1, p2} -> abs(p1) + abs(p2) end)
    |> Enum.min()
  end

  defp get_paths(lines) do
    for <<direction, times::bits>> <- lines do
      direction = <<direction>>
      times = String.to_integer(times)
      {direction, times}
    end
  end

  defp draw_paths(lines) do
    {positions, _} =
      for {direction, times} <- lines, _n <- 1..times, reduce: {MapSet.new(), {0, 0}} do
        {positions, last_position} ->
          p = calc_position(direction, last_position)
          {MapSet.put(positions, p), p}
      end

    positions
  end

  defp calc_position(direction, {x, y}) do
    case direction do
      "R" -> {x + 1, y}
      "L" -> {x - 1, y}
      "U" -> {x, y + 1}
      "D" -> {x, y - 1}
    end
  end
end
