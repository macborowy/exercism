defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit), do: 2..limit |> select_primes(limit)

  def select_primes(list, limit, number \\ 2)
  def select_primes(list, _, nil), do: list
  def select_primes(list, limit, number) when number * number > limit,
    do: list
  def select_primes(list, limit, number) do
    cleaned = remove_multiples_for(list, number)
    next = next(cleaned, number)

    select_primes(cleaned, limit, next)
  end

  def remove_multiples_for(list, number) do
    list
    |> Enum.reject(fn x -> x > number and rem(x, number) == 0 end)
  end

  def next(list, number) do
    list
    |> Enum.split_while(&(&1 <= number))
    |> elem(1)
    |> hd
  end
end
