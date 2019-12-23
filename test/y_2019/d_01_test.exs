defmodule AOC.Y2019.D01Test do
  use ExUnit.Case

  @input "./inputs/y_2019/d_01.txt"

  test "part_1" do
    assert AOC.Y2019.D01.part_1(@input) == 3_478_233
  end

  test "part_2" do
    assert AOC.Y2019.D01.part_2(@input) == 5_214_475
  end
end
