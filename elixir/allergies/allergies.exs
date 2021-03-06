defmodule Allergies do
  import Bitwise, only: [&&&: 2]

  @flags [
    {1, "eggs"},
    {2, "peanuts"},
    {4, "shellfish"},
    {8, "strawberries"},
    {16, "tomatoes"},
    {32, "chocolate"},
    {64, "pollen"},
    {128, "cats"}
  ]

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(flags) do
    @flags
    |> Enum.filter_map(fn {value, _} -> (flags &&& value) == value end,
                       fn {_, allergy} -> allergy end)
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(flags, item) do
    flags
    |> list
    |> Enum.any?(&(&1 == item))
  end
end
