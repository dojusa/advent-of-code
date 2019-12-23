defmodule AOC.Y2019.D03 do
  def part_1(input) do
    find_intersections(input)
    |> Enum.map(fn {{p1, p2}, _} -> abs(p1) + abs(p2) end)
    |> Enum.min()
  end

  def part_2(input) do
    find_intersections(input)
    |> Enum.map(fn {_k, {:inter, v}} -> v end)
    |> Enum.min()
  end

  defp find_intersections(input) do
    [wire1, wire2] = draw_wires(input)

    wire1
    |> Map.merge(wire2, fn _k, v1, v2 -> {:inter, v1 + v2} end)
    |> Enum.filter(fn {_k, v} -> is_tuple(v) end)
  end

  defp draw_wires(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, ",", trim: true))
    |> Enum.map(&get_paths/1)
    |> Enum.map(&draw_paths/1)
  end

  defp get_paths(lines) do
    for <<direction, times::bits>> <- lines do
      direction = <<direction>>
      times = String.to_integer(times)
      {direction, times}
    end
  end

  defp draw_paths(lines) do
    {positions, _, _} =
      for {direction, times} <- lines, _ <- 1..times, reduce: {%{}, {0, 0}, 0} do
        {positions, last_position, cost} ->
          cost = cost + 1
          p = calc_position(direction, last_position)
          positions = Map.put_new(positions, p, cost)
          {positions, p, cost}
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
