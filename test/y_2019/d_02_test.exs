defmodule AOC.Y2019.D02Test do
  use ExUnit.Case

  setup_all do
    file_path = "./inputs/y_2019/d_02.txt"
    [input: File.read!(file_path)]
  end

  test "part_1", %{input: input} do
    assert AOC.Y2019.D02.part_1(input) == 3_101_878
  end

  test "part_2", %{input: input} do
    assert AOC.Y2019.D02.part_2(input) == 8444
  end
end
