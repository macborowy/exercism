defmodule BinarySearch do
  @doc """
    Searches for a key in the list using the binary search algorithm.
    It returns :not_found if the key is not in the list.
    Otherwise returns the tuple {:ok, index}.

    ## Examples

      iex> BinarySearch.search([], 2)
      :not_found

      iex> BinarySearch.search([1, 3, 5], 2)
      :not_found

      iex> BinarySearch.search([1, 3, 5], 5)
      {:ok, 2}

  """
  @spec search(Enumerable.t, integer) :: {:ok, integer} | :not_found
  def search([], _), do: :not_found
  def search(list, key) do
    if sorted?(list) do
      list |> Enum.with_index |> do_search(key)
    else
      :not_found
    end
  end

  def do_search([], _), do: :not_found
  def do_search([{_, index} | []], _), do: {:ok ,index}
  def do_search(list, key) do
    list
    |> split_middle
    |> choose_list(key)
    |> do_search(key)
  end

  def split_middle(list) do
    middle = middle(list)

    {lower, higher} =
      list
      |> Enum.with_index
      |> Enum.split_while(fn {_, index} -> index <= middle end)

    %{
      lower: Enum.map(lower, fn {element, _} -> element end),
      higher: Enum.map(higher, fn {element, _} -> element end)
    }
  end

  def middle(list) when length(list) <= 2, do: 0
  def middle(list) do
    list |> length |> div(2)
  end

  def choose_list(%{lower: lower, higher: higher}, key) do
    cond do
      Enum.any?(lower, fn {value, _} -> value == key end) -> lower
      Enum.any?(higher, fn {value, _} -> value == key end) -> higher
      true -> []
    end
  end

  def sorted?([_|[]]), do: true
  def sorted?([a | tail = [next | _]]) when a < next, do: sorted?(tail)
  def sorted?(_), do: raise ArgumentError, message: "expected list to be sorted"
end
