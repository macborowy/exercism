if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("queen_attack.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule MyQueensTests do
  use ExUnit.Case

  describe "queen position tests" do

    test "for {0, 0} should return 0" do
      assert Queens.queen_position({0,0}) == 0
    end

    test "for {0,7} should return 7" do
      assert Queens.queen_position({0, 7}) == 7
    end

    test "for {1,0} should return 8" do
      assert Queens.queen_position({1,0}) == 8
    end

    test "for {7,7} should return 63" do
      assert Queens.queen_position({7,7}) == 63
    end
  end

  # describe "attack fields" do
  #
  #   test "for position {0, 0} and vector {1, 0} should return 7 fields up to {7, 0}" do
  #     assert Queens.attack_fields({0,0}, {1,0}, []) ==
  #       [{7, 0}, {6, 0}, {5, 0}, {4, 0}, {3, 0}, {2, 0}, {1, 0}]
  #   end
  #
  #   test "for position {7, 0} an vector {1, 0} should return empty list" do
  #     assert Queens.attack_fields({7, 0}, {1, 0}, []) == []
  #   end
  #
  #   test "for position {7, 0} and vector {-1, 0} should return 7 fields in same column" do
  #     assert Queens.attack_fields({7,0}, {-1, 0}, []) ==
  #       [{0, 0}, {1, 0}, {2, 0}, {3, 0}, {4, 0}, {5, 0}, {6, 0}]
  #   end
  #
  #   test "for position {0, 0} and vector {0, 1} should return 7 fields in same row" do
  #     assert Queens.attack_fields({0, 0}, {0, 1}, []) ==
  #       [{0, 7}, {0, 6}, {0, 5}, {0, 4}, {0, 3}, {0, 2}, {0, 1}]
  #   end
  #
  #   test "for position {0, 0} and vector {1, 1} should return 7 diagonal fields up to {7, 7}" do
  #     assert Queens.attack_fields({0, 0}, {1, 1}, []) ==
  #       [{7, 7}, {6, 6}, {5, 5}, {4, 4}, {3, 3}, {2, 2}, {1, 1}]
  #   end
  # end

end

defmodule QueenAttackTest do
  use ExUnit.Case

  # @tag :pending
  test "default positions" do
    queens = Queens.new
    assert queens.white == {0, 3}
    assert queens.black == {7, 3}
  end

  # @tag :pending
  test "specific placement" do
    queens = Queens.new({3, 7}, {6, 1})
    assert queens.white == {3, 7}
    assert queens.black == {6, 1}
  end

  # @tag :pending
  test "cannot occupy same space" do
    assert_raise ArgumentError, fn ->
      Queens.new({2, 4}, {2, 4})
    end
  end

  # @tag :pending
  test "string representation" do
    queens = Queens.new({2, 4}, {6, 6})
    board = String.split """
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ W _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ B _
_ _ _ _ _ _ _ _
    """
    assert Queens.to_string(queens) == board
  end

  # @tag :pending
  test "another string representation" do
    queens = Queens.new({7, 1}, {0, 0})
    board = String.split """
B _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ W _ _ _ _ _ _
    """
    assert Queens.to_string(queens) == board
  end

  # @tag :pending
  test "yet another string representation" do
    queens = Queens.new({4, 3}, {3, 4})
    board = String.split """
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ B _ _ _
_ _ _ W _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
    """
    assert Queens.to_string(queens) == board
  end

  # @tag :pending
  test "queen placed on the bottom right corner" do
    queens = Queens.new({4, 3}, {7, 7})
    board = String.split """
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ W _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ B
    """
    assert Queens.to_string(queens) == board
  end

  # @tag :pending
  test "queen placed on the edge of the board" do
    queens = Queens.new({4, 3}, {2, 7})
    board = String.split """
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ B
_ _ _ _ _ _ _ _
_ _ _ W _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
    """
    assert Queens.to_string(queens) == board
  end

  # @tag :pending
  test "cannot attack" do
    queens = Queens.new({2, 3}, {4, 7})
    refute Queens.can_attack?(queens)
  end

  # @tag :pending
  test "can attack on same row" do
    queens = Queens.new({2, 4}, {2, 7})
    assert Queens.can_attack?(queens)
  end

  # @tag :pending
  test "can attack on same column" do
    queens = Queens.new({5, 4}, {2, 4})
    assert Queens.can_attack?(queens)
  end

  # @tag :pending
  test "can attack on diagonal" do
    queens = Queens.new({1, 1}, {6, 6})
    assert Queens.can_attack?(queens)
  end

  # @tag :pending
  test "can attack on other diagonal" do
    queens = Queens.new({0, 6}, {1, 7})
    assert Queens.can_attack?(queens)
  end

  # @tag :pending
  test "can attack on yet another diagonal" do
    queens = Queens.new({4, 1}, {6, 3})
    assert Queens.can_attack?(queens)
  end

  # @tag :pending
  test "can attack on a diagonal slanted the other way" do
    queens = Queens.new({6, 1}, {1, 6})
    assert Queens.can_attack?(queens)
  end
end
