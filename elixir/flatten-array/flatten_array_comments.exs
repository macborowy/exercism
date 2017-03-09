defmodule Flattener do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> Flattener.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> Flattener.flatten([nil, nil])
      []

  """
  @spec flatten(list) :: list
  def flatten(list) do
    do_flatten(list)
  end

  @doc """
  Function header
    - list - list to flatten
    - acc - accumulator of flattened list values
    - tails - accumulator of tails dropped during nesting
  """
  defp do_flatten(list, acc \\ [], tails \\ [])

  # stop clause
  defp do_flatten([], acc, []), do: Enum.reverse(acc)

  # call do_flatten with first available tail in tails
  defp do_flatten([], acc, [h | t]), do: do_flatten(h, acc, t)

  @doc """
  Function needs to examine if list head (h) is list (nested list) or not.
  - if head is nested list, then call do_flatten with this head and append list tail (t) to tails
    (when head will be flattened this tail will be next value to flatten).
  - if head is not a nested list, function needs to check if it's not a nil value.
    - if head is nil, skip this head and call do_flatten with list tail (t) as first argument.
    - if head is not nil, append head to accumulator and call do_flatten with list tail (t) as first argument.
  """
  defp do_flatten([h | t], acc, tails) do
    case is_list(h) do
      true  -> do_flatten(h, acc, [t | tails])
      false ->
        case h do
          nil -> do_flatten(t, acc, tails) # skip nil head
          _   -> do_flatten(t, [h | acc], tails) # append head and check list tail
        end
    end
  end
end
