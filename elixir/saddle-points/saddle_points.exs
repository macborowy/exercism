defmodule Matrix do
  @doc ~S"""
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(string), do: string |> to_matrix

  @doc ~S"""
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(string) do
    string
    |> to_matrix
    |> transpose
  end


  @doc ~S"""
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(string) do
    for {row, row_index} <- rows(string) |> Enum.with_index,
        {column, column_index} <- columns(string) |> Enum.with_index,
        Enum.min(column) == Enum.max(row),
        do: {row_index, column_index}
  end

  @spec to_matrix(String.t) :: [[integer]]
  defp to_matrix(string) do
    string
    |> String.split("\n")
    |> Enum.map(&String.split(&1, " "))
    |> Enum.map(fn str -> Enum.map(str, &String.to_integer/1) end)
  end

  @spec transpose([[integer]]) :: [[integer]]
  defp transpose(matrix) do
    matrix
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end
end
