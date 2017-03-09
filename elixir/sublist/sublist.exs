defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      matching?(a, b) -> :sublist
      matching?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp matching?(a, b) do
    case do_compare(a, b) do
      :match -> true
      :failed -> false
    end
  end

  # I assume that list a should always has less or equal elements then list b,
  # otherwise they are unequal
  # (this condition might happen after few do_compare/2 calls)
  defp do_compare(a, b = [_ | tb]) when length(a) <= length(b) do

      are_equal? =
        Enum.take(b, length(a)) |>
        are_equal?(a)

      case are_equal? do
        true -> :match
        false -> do_compare(a, tb)
      end
  end

  # when list a has more elements then list b they are for sure :unequal
  defp do_compare(a, b) when length(a) > length(b), do: :failed

  defp do_compare([], _), do: :match
  defp do_compare(_, []), do: :failed

  def are_equal?(a, b), do: a === b
end
