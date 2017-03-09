if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("saddle_points.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule DocTests do
  use ExUnit.Case
  doctest Matrix
end

defmodule BetterSaddlePointsTests do
  use ExUnit.Case

  test "should generate " do
    assert Matrix.saddle_points("1 2 3\n4 5 6\n7 8 9") == [{0, 2}]
  end
end

defmodule MySaddlePointsTests do
  use ExUnit.Case

  describe "candidates should return candidates for saddle points" do
    test "when select_function is Enum.max should return largest number in enumerable" do
      mapper_function =
        fn ({value, column_index}, row_index) ->
          {row_index, column_index, value} end

      assert Matrix.candidates([1, 2, 1], 0, &Enum.max/1, mapper_function) ==
        [{0, 1, 2}]
    end

    test "when select_function is Enum.min should return minimum of enumerable" do
      mapper_function =
        fn ({value, row_index}, column_index) ->
          {row_index, column_index, value} end

      assert Matrix.candidates([1, 2, 3], 0, &Enum.min/1, mapper_function) ==
        [{0, 0, 1}]
    end

    test "when enumerable contains multiple minimal values should return list of maps" do
      mapper_function =
        fn ({value, row_index}, column_index) ->
          {row_index, column_index, value} end

      assert Matrix.candidates([1, 2, 1], 0, &Enum.min/1, mapper_function) ==
        [{0, 0, 1}, {2, 0, 1}]
    end
  end

  describe "str_to_candidates tests" do
    test "for given string should return row candidates for saddle points" do
      str = "1 2\n3 4"
      assert Matrix.str_to_candidates(str, :rows) == [{0, 1, 2}, {1, 1, 4}]
    end

    test "for given string should return column candidates for saddle points" do
      str = "1 2\n3 4"
      assert Matrix.str_to_candidates(str, :columns) == [{0, 0, 1}, {0, 1, 2}]
    end
  end
end

defmodule SaddlePointsTest do
  use ExUnit.Case

  # @tag :pending
  test "extract rows" do
    rows = Matrix.rows("1 2\n10 20")
    assert rows == [[1, 2], [10, 20]]
  end

  # @tag :pending
  test "extract a row" do
    rows = Matrix.rows("9 7\n8 6")
    assert Enum.at(rows, 0) == [9, 7]
  end

  # @tag :pending
  test "extract other row" do
    rows = Matrix.rows("9 8 7\n19 18 17")
    assert Enum.at(rows, 1) == [19, 18, 17]
  end

  # @tag :pending
  test "extract other row again" do
    rows = Matrix.rows("1 4 9\n16 25 36")
    assert Enum.at(rows, 1) == [16, 25, 36]
  end

  # @tag :pending
  test "extract a column" do
    columns = Matrix.columns("1 2 3\n4 5 6\n7 8 9\n8 7 6")
    assert Enum.at(columns, 0) == [1, 4, 7, 8]
  end

  # @tag :pending
  test "extract another column" do
    columns = Matrix.columns("89 1903 3\n18 3 1\n9 4 800")
    assert Enum.at(columns, 1) == [1903, 3, 4]
  end

  # @tag :pending
  test "no saddle point" do
    saddle_points = Matrix.saddle_points("2 1\n1 2")
    assert saddle_points == []
  end

  # @tag :pending
  test "a saddle point" do
    saddle_points = Matrix.saddle_points("1 2\n3 4")
    assert saddle_points == [{0, 1}]
  end

  # @tag :pending
  test "another saddle point" do
    saddle_points = Matrix.saddle_points("18 3 39 19 91\n38 10 8 77 320\n3 4 8 6 7")
    assert saddle_points == [{2, 2}]
  end

  # @tag :pending
  test "multiple saddle points" do
    saddle_points = Matrix.saddle_points("4 5 4\n3 5 5\n1 5 4")
    assert saddle_points == [{0, 1}, {1, 1}, {2, 1}]
  end
end
