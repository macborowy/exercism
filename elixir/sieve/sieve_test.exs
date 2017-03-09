if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("sieve.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

# defmodule NextTests do
#   use ExUnit.Case
#
#   test "for [2,3,5,7,11] and current 5 should return 7" do
#     assert Sieve.next([2,3,5,7,11], 5) == 7
#   end
# end
#
# defmodule SelectPrimesTests do
#   use ExUnit.Case
#
#   test "for list [2,3,4,5,6] and limit equal to 6 should return [2,3,5]" do
#     assert Sieve.select_primes([2,3,4,5,6], 6) == [2,3,5]
#   end
# end
#
# defmodule RemoveMultiplesTests do
#   use ExUnit.Case
#
#   test "for [2,3,4] should remove all multiples of 2 and return [2,3]" do
#     assert Sieve.remove_multiples_for([2,3,4], 2) == [2,3]
#   end
# end

defmodule SieveTest do
  use ExUnit.Case

  # @tag :pending
  test "a few primes" do
    assert Sieve.primes_to(10) == [2, 3, 5, 7]
  end

  # @tag :pending
  test "primes to 1000" do
    result = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37,
    41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83,
    89, 97, 101, 103, 107, 109, 113, 127, 131,
    137, 139, 149, 151, 157, 163, 167, 173, 179,
    181, 191, 193, 197, 199, 211, 223, 227, 229,
    233, 239, 241, 251, 257, 263, 269, 271, 277,
    281, 283, 293, 307, 311, 313, 317, 331, 337,
    347, 349, 353, 359, 367, 373, 379, 383, 389,
    397, 401, 409, 419, 421, 431, 433, 439, 443,
    449, 457, 461, 463, 467, 479, 487, 491, 499,
    503, 509, 521, 523, 541, 547, 557, 563, 569,
    571, 577, 587, 593, 599, 601, 607, 613, 617,
    619, 631, 641, 643, 647, 653, 659, 661, 673,
    677, 683, 691, 701, 709, 719, 727, 733, 739,
    743, 751, 757, 761, 769, 773, 787, 797, 809,
    811, 821, 823, 827, 829, 839, 853, 857, 859,
    863, 877, 881, 883, 887, 907, 911, 919, 929,
    937, 941, 947, 953, 967, 971, 977, 983, 991, 997]
    assert Sieve.primes_to(1000) == result
  end

  test "primes to 100_000" do
    assert Sieve.primes_to(100_000) |> Enum.at(0) == 2
  end
end
