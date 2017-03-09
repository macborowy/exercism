if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("pascals_triangle.exs")
end


ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule MyPascalsTriangleTests do
  use ExUnit.Case

  describe "create_row tests" do
    test "when input list is [0, 1, 0] should return [1, 1]" do
      assert PascalsTriangle.create_row([0,1,0], []) == [1,1]
    end
  end
end

defmodule PascalsTriangleTest do
  use ExUnit.Case

  # @tag pending
  test "one row" do
    assert PascalsTriangle.rows(1) == [[1]]
  end

  # @tag :pending
  test "two rows" do
    assert PascalsTriangle.rows(2) == [[1], [1, 1]]
  end

  # @tag :pending
  test "three rows" do
    assert PascalsTriangle.rows(3) == [[1], [1, 1], [1, 2, 1]]
  end

  # @tag :pending
  test "fourth row" do
    assert List.last(PascalsTriangle.rows(4)) ==  [1, 3, 3, 1]
  end

  # @tag :pending
  test "fifth row" do
    assert List.last(PascalsTriangle.rows(5)) ==  [1, 4, 6, 4, 1]
  end

  # @tag :pending
  test "twentieth row" do
    expected = [
      1, 19, 171, 969, 3876, 11_628, 27_132, 50_388, 75_582, 92_378, 92_378,
      75_582, 50_388, 27_132, 11_628, 3876, 969, 171, 19, 1
    ]
    assert List.last(PascalsTriangle.rows(20)) ==  expected
  end

  test "50th row" do
    assert PascalsTriangle.rows(50) |> List.last |> length == 50
  end

  test "100th row" do
    assert PascalsTriangle.rows(100) |> List.last |> length == 100
  end

  test "1000th row" do
    assert PascalsTriangle.rows(1000) |> List.last |> length == 1000
  end
end
