defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num), do: do_rows(num - 1, [[1]])

  @spec do_rows(integer, [integer]) :: [[integer]]
  def do_rows(0, acc), do: Enum.reverse(acc)
  def do_rows(rows_left, acc = [previous_row | _]) do
    new_row =
      [0 | previous_row] ++ [0]
      |> create_row

    do_rows(rows_left - 1, [new_row | acc])
  end

  @spec create_row([integer]) :: [integer]
  def create_row(base_row, acc \\ [])
  def create_row([a | tail = [b | _]], acc), do: create_row(tail, [a + b | acc])
  def create_row([_ | []], acc), do: acc
end
