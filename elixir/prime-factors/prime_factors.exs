defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number), do: do_factors(number, 2, [])

  defp do_factors(1, _, acc),
    do: Enum.reverse(acc)
  defp do_factors(number, i, acc) when rem(number, i) == 0,
    do: do_factors(div(number, i), i, [i | acc])
  defp do_factors(number, i, acc),
    do: do_factors(number, i + 1, acc)
end
