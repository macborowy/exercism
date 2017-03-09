defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  def generate(_, []), do: :error
  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(amount, values) do
    values =
      values
      |> Enum.sort
      |> Enum.reverse

    do_generate(amount, values, Map.new(values, &{&1, 0}))
  end

  @spec do_generate(pos_integer, nonempty_list(pos_integer), %{integer => integer}) :: {atom, %{integer => integer}}
  def do_generate(0, _, acc), do: {:ok, acc}
  def do_generate(amount, values, acc) do
    coin =
      values
      |> Enum.find(&(amount - &1 >= 0))

    case coin do
      nil -> :error
      _ -> do_generate(amount - coin, values, Map.update(acc, coin, 0, &(&1 + 1)))
    end
  end
end
