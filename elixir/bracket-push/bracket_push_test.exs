if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("bracket_push.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule BracketPushTest do
  use ExUnit.Case

  # @tag :pending
  test "empty string" do
    assert BracketPush.check_brackets("")
  end

  # @tag :pending
  test "appropriate bracketing in a set of brackets" do
    assert BracketPush.check_brackets("{}")
  end

  # @tag :pending
  test "unclosed brackets" do
    refute BracketPush.check_brackets("{{")
  end

  # @tag :pending
  test "more than one pair of brackets" do
    assert BracketPush.check_brackets("{}[]")
  end

  # @tag :pending
  test "brackets are out of order" do
    refute BracketPush.check_brackets("}{")
  end

  # @tag :pending
  test "nested brackets" do
    assert BracketPush.check_brackets("{[()]}")
  end

  # @tag :pending
  test "unbalanced nested brackets" do
    refute BracketPush.check_brackets("{[}]")
  end

  # @tag :pending
  test "bracket closure with deeper nesting" do
    refute BracketPush.check_brackets("{[)][]}")
  end

  # @tag :pending
  test "bracket closure in a long string of brackets" do
    assert BracketPush.check_brackets("{[]([()])}")
  end

  # @tag :pending
  test "should ignore non-bracket characters" do
    assert BracketPush.check_brackets("{hello[]([a()])b}c")
  end

  # @tag :pending
  test "string with newlines" do
    assert BracketPush.check_brackets("[]\n{()}\n[(({}))]\n")
  end
end
#
# defmodule GetValueTests do
#
#   use ExUnit.Case
#
#   test "for empty string should return 0" do
#     assert BracketPush.get_char_value("") == 0
#   end
#
#   test "for ( should return 1" do
#     assert BracketPush.get_char_value("(") == 1
#   end
#
#   test "for ) should return -1" do
#     assert BracketPush.get_char_value(")") == -1
#   end
#
#   test "for any other character then bracket return 0" do
#     assert BracketPush.get_char_value("a") == 0
#   end
#
#   test "for string should raise exception" do
#     assert_raise(
#       FunctionClauseError,
#       fn -> BracketPush.get_char_value("asd") end)
#   end
# end
#
# defmodule GetChecksumTests do
#
#   use ExUnit.Case
#
#   test "when string contain no bracket characters should return 0" do
#     assert BracketPush.get_checksum("asd") == %{:curly => 0, :square => 0, :normal => 0}
#   end
#
#   test "when string is ( should return 1" do
#     assert BracketPush.get_checksum("(") == %{:curly => 0, :square => 0, :normal => 1}
#   end
#
#   test "when string is () should return 0" do
#     assert BracketPush.get_checksum("()") == %{:curly => 0, :square => 0, :normal => 0}
#   end
#
#   test "when string is ({}) should return 0" do
#     assert BracketPush.get_checksum("({})") == %{:curly => 0, :square => 0, :normal => 0}
#   end
#
#   test "when string is (() should return -1" do
#     assert BracketPush.get_checksum("())") == %{:curly => 0, :square => 0, :normal => -1}
#   end
# end
#
# defmodule DefineBracketTests do
#
#   use ExUnit.Case
#
#   test "when string is empty return :undefined" do
#     assert BracketPush.define_bracket("") == :undefined
#   end
#
#   test "when char is word character should return :undefined" do
#     assert BracketPush.define_bracket("a") == :undefined
#   end
#
#   test "when char is normal bracket should return :normal" do
#     assert BracketPush.define_bracket("(") == :normal
#     assert BracketPush.define_bracket(")") == :normal
#   end
#
#   test "when char is square bracket should return :square" do
#     assert BracketPush.define_bracket("[") == :square
#     assert BracketPush.define_bracket("]") == :square
#   end
#
#   test "when char is curly bracket should return :curly" do
#     assert BracketPush.define_bracket("{") == :curly
#     assert BracketPush.define_bracket("}") == :curly
#   end
# end

defmodule RemoveNonBracketsTests do

  use ExUnit.Case

  test "when string is empty should return empty string" do
    assert BracketPush.remove_non_bracket_characters("") == ""
  end

  test "when string is (a) should return ()" do
    assert BracketPush.remove_non_bracket_characters("(a)") == "()"
  end

  test "should remove new lines" do
    assert BracketPush.remove_non_bracket_characters("(\na)") == "()"
  end

  test "when string contains only supported brackets should return same string" do
    assert BracketPush.remove_non_bracket_characters("({[]})") == "({[]})"
  end
end

defmodule TrimAllBracketPairTests do

  use ExUnit.Case

  test "when string is empty should return string empty" do
    assert BracketPush.remove_all_bracket_pairs("") == ""
  end

  test "when string contains supported brackets should return empty string" do
    assert BracketPush.remove_all_bracket_pairs("{}") == ""
  end

  test "when string contains nested brackets should remove all bracket pairs until no other pairs are available" do
    assert BracketPush.remove_all_bracket_pairs("([])") == ""
  end

  test "when string contains unmatched brackets should return only unmatched brackets" do
    assert BracketPush.remove_all_bracket_pairs("[{}](") == "("
  end

end
