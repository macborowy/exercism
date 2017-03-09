if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("crypto_square.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

# defmodule ColumnsTests do
#   use ExUnit.Case
#
#   test "for 'a' string should return {1, 1}" do
#     assert CryptoSquare.columns("a") == 1
#   end
#
#   test "for 'ab' should return {2, 1}" do
#     assert CryptoSquare.columns("ab") == 2
#   end
#
#   test "for 'abc' should return {2, 2}" do
#     assert CryptoSquare.columns("abc") == 2
#   end
#
#   test "for 'abcd' should return {2, 2}" do
#     assert CryptoSquare.columns("abcd") == 2
#   end
#
#   test "for string with 67 characters should return {8, 8}" do
#     assert CryptoSquare.columns("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") == 8
#   end
# end

defmodule ToRectangleTests do
  use ExUnit.Case

  test "string abcd should return [[ab], [cd]]" do
    assert CryptoSquare.to_rectangle("abcd") == [["a", "b"], ["c", "d"]]
  end
end

defmodule TransposeTests do
  use ExUnit.Case

  test "should transpose provided rectangle" do
    assert CryptoSquare.transpose([["a", "b"], ["c", "d"]]) == [["a", "c"], ["b", "d"]]
  end
end

# defmodule CreateSquareTests do
#   use ExUnit.Case
#
#   test "for string with 1 character should return 1 character" do
#     assert CryptoSquare.create_square(["a"], 1, 0, []) == [["a"]]
#   end
#
#   test "for string abc characters should return ac b" do
#     assert CryptoSquare.create_square(["a", "b", "c"], 2, 0, []) == [["a", "c"], ["b"]]
#   end
# end

defmodule CryptoSquareTest do
  use ExUnit.Case
  doctest CryptoSquare

  # @tag :pending
  test "empty string" do
    assert CryptoSquare.encode("") == ""
  end

  # @tag :pending
  test "perfect square" do
    assert CryptoSquare.encode("abcd") == "ac bd"
  end

  # @tag :pending
  test "uppercase string" do
    assert CryptoSquare.encode("ABCD") == "ac bd"
  end

  # @tag :pending
  test "small imperfect square" do
    assert CryptoSquare.encode("This is easy") == "tis hsy ie sa"
  end

  # @tag :pending
  test "punctuation and numbers" do
    assert CryptoSquare.encode("1, 2, 3, Go! Go, for God's sake!") == "1gga 2ook 3fde gos ors"
  end

  # @tag :pending
  test "long string" do
    msg = "If man was meant to stay on the ground, god would have given us roots."
    cipher = "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau"
    assert CryptoSquare.encode(msg) == cipher
  end
end
