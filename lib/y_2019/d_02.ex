defmodule AOC.Y2019.D02 do
  @default_subs %{1 => 12, 2 => 2}
  @expected_part_2_output 19_690_720

  def part_1(input, subs \\ @default_subs) do
    positions =
      input
      |> String.split(",", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> Enum.with_index()
      |> Enum.into(%{}, fn {value, index} ->
        value = Map.get(subs, index, value)
        {index, value}
      end)

    calc(positions, 0, positions[0])
  end

  def part_2(input) do
    noun = calc_noun(input)
    verb = calc_verb(input, noun)
    100 * noun + verb
  end

  defp calc_verb(input, noun, verb \\ 1) do
    part_1(input, %{1 => noun, 2 => verb})
    |> case do
      @expected_part_2_output ->
        verb

      _ ->
        calc_verb(input, noun, verb + 1)
    end
  end

  defp calc_noun(input, noun \\ 1, last_noun \\ 1) do
    output = part_1(input, %{1 => noun})

    cond do
      output < @expected_part_2_output and last_noun > noun ->
        noun

      output < @expected_part_2_output ->
        calc_noun(input, noun * 2, noun)

      output > @expected_part_2_output ->
        calc_noun(input, noun - 1, noun)
    end
  end

  defp calc(positions, _head, op_code) when op_code not in [1, 2] do
    positions[0]
  end

  defp calc(positions, head, op_code) do
    op = operation(op_code)
    first_input = positions[positions[head + 1]]
    second_input = positions[positions[head + 2]]
    output_position = positions[head + 3]

    result = apply(Kernel, op, [first_input, second_input])
    positions = %{positions | output_position => result}

    head = head + 4
    calc(positions, head, positions[head])
  end

  defp operation(1), do: :+
  defp operation(2), do: :*
end
