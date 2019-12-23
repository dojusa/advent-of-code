defmodule AOC.Y2019.D03Test do
  use ExUnit.Case

  setup_all do
    file_path = "./inputs/y_2019/d_03.txt"
    [input: File.read!(file_path)]
  end

  describe "part_1" do
    test "expects 6" do
      input = """
      R8,U5,L5,D3
      U7,R6,D4,L4
      """

      assert AOC.Y2019.D03.part_1(input) == 6
    end

    test "expects 159" do
      input = """
      R75,D30,R83,U83,L12,D49,R71,U7,L72
      U62,R66,U55,R34,D71,R55,D58,R83
      """

      assert AOC.Y2019.D03.part_1(input) == 159
    end

    test "expects 135" do
      input = """
      R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51
      U98,R91,D20,R16,D67,R40,U7,R15,U6,R7
      """

      assert AOC.Y2019.D03.part_1(input) == 135
    end

    test "expects 2427", %{input: input} do
      assert AOC.Y2019.D03.part_1(input) == 2427
    end
  end

  describe "part_2" do
    test "expects 6" do
      input = """
      R1,U1
      U1,R1
      """

      assert AOC.Y2019.D03.part_2(input) == 4
    end

    test "expects 610" do
      input = """
      R75,D30,R83,U83,L12,D49,R71,U7,L72
      U62,R66,U55,R34,D71,R55,D58,R83
      """

      assert AOC.Y2019.D03.part_2(input) == 610
    end

    test "expects 27890", %{input: input} do
      assert AOC.Y2019.D03.part_2(input) == 27890
    end
  end
end
