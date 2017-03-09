defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct black: nil, white: nil

  @doc """
  Creates a new set of Queens
  """
  @spec new() :: Queens.t()
  def new(), do: %Queens{black: {7, 3}, white: {0, 3}}

  @spec new({integer, integer}, {integer, integer}) :: Queens.t()
  def new(same, same), do: raise ArgumentError
  def new(white, black), do: %Queens{black: black, white: white}

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(queens) do
    1..64
    |> Enum.map(fn x -> "_" end)
    |> List.update_at(queen_position(queens.black), fn x -> "B" end)
    |> List.update_at(queen_position(queens.white), fn x -> "W" end)
  end

  def queen_position({row, column}), do: (row * 7) + row + column

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(%Queens{black: {r1, c1}, white: {r2, c2}}) do
    r1 == r2 || c1 == c2 || abs(r1 - r2) == abs(c1 - c2)
  end
end
