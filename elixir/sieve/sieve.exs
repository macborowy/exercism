defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit), do: 2..limit |> Enum.to_list |> select_primes(limit)

  defp select_primes(list, limit, acc \\ [])
  defp select_primes([h | t], limit, acc) when h * h <= limit do
    Enum.filter(t, &(rem(&1, h) != 0))
    |> select_primes(limit, [h | acc])
  end
  defp select_primes(list, _, acc),
    do: Enum.reverse(acc) ++ list
end
