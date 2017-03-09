if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("diamond.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule IndentTests do
  use ExUnit.Case

  test "for ?A should not add spaces" do
    assert Diamond.indent(?A, ?A) == []
  end

  test "for ?B should return one space" do
    assert Diamond.indent(?B, ?A) == [" "]
  end
end

defmodule LineTests do
  use ExUnit.Case

  test "for A and B should return A with one space" do
    assert Diamond.line(?A, ?B) == " A"
  end

  test "for A and B should return B B" do
    assert Diamond.line(?B, ?B) == "B B"
  end
end

# defmodule CreateLinesTests do
#   use ExUnit.Case
#
#   test "for " do
#     assert Diamond.create_lines([{?A, {0, 0}}], ?A) == [[?A]]
#   end
# end
#
# defmodule GetPostionsTests do
#   use ExUnit.Case
#
#   test "for range 'AB'" do
#     assert Diamond.get_positions({?A, 0}, 2) == {?A, {1, 1}}
#     assert Diamond.get_positions({?B, 1}, 2) == {?B, {0, 2}}
#   end
# end
#
# defmodule SetLettersPositionsTests do
#   use ExUnit.Case
#
#   test "for [A] and letter A should return {'A', 0}" do
#     assert Diamond.set_letters_positions('A') == [{?A, {0, 0}}]
#   end
#
#   test "for [A, B] should return list of character positions" do
#     assert Diamond.set_letters_positions('AB') == [{?A, {1, 1}}, {?B, {0, 2}}]
#   end
# end
#
# defmodule GetLettersTests do
#   use ExUnit.Case
#
#   test "when ?A is passed should return list with single element A" do
#     assert Diamond.get_letters(?A) == 'A'
#   end
#
#   test "when ?E is passed should return list of characters from E to A" do
#     assert Diamond.get_letters(?E) == 'ABCDE'
#   end
#
#   test "when character is not in range A-Z should return Error" do
#     assert_raise FunctionClauseError, fn -> Diamond.get_letters(?1) end
#     assert_raise FunctionClauseError, fn -> Diamond.get_letters(?a) end
#   end
# end

defmodule DiamondTest do
  use ExUnit.Case

  # @tag :pending
  test "letter A" do
    shape = Diamond.build_shape(?A)
    assert shape == "A\n"
  end

  # @tag :pending
  test "letter C" do
    shape = Diamond.build_shape(?C)
    assert shape == """
\s A
\sB B
 C   C
\sB B
\s A
    """
  end

  # @tag :pending
  test "letter E" do
    shape = Diamond.build_shape(?E)
    assert shape == """
\s   A
\s  B B
\s C   C
\sD     D
 E       E
\sD     D
\s C   C
\s  B B
\s   A
    """
  end
end
