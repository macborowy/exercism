if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("luhn.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule MyLuhnTests do
  use ExUnit.Case

  describe "test from excercise description" do
    test "2323 2005 7766 355 should return 2323 2005 7766 3554" do
      assert Luhn.create("232320057766355") == "2323200577663554"
    end
  end
end

defmodule LuhnTest do
  use ExUnit.Case

  test "checksum" do
    assert Luhn.checksum("4913") == 22
  end

  # @tag :pending
  test "checksum again" do
    assert Luhn.checksum("201773") == 21
  end

  # @tag :pending
  test "invalid number" do
    assert Luhn.valid?("738") == false
  end

  # @tag :pending
  test "valid number" do
    assert Luhn.valid?("8739567") == true
  end

  # @tag :pending
  test "create valid number" do
    assert Luhn.create("123") == "1230"
  end

  # @tag :pending
  test "create other valid number" do
    assert Luhn.create("873956") == "8739567"
  end

  # @tag :pending
  test "create yet another valid number" do
    assert Luhn.create("837263756") == "8372637564"
  end
end
