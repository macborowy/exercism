defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(map) :: map
  def transform(input) do
    Enum.map(input, &convert/1)
    |> List.flatten
    |> Map.new
  end

  def convert({key, values}) do
    Enum.map(values, fn word -> {String.downcase(word), key} end)
  end
end
