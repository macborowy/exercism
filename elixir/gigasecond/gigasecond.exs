defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @gigasecond 1_000_000_000

  @spec from(:calendar.datetime) :: :calendar.datetime
  def from(datetime) do
    datetime
    |> :calendar.datetime_to_gregorian_seconds
    |> Kernel.+(@gigasecond)
    |> :calendar.gregorian_seconds_to_datetime
  end
end
