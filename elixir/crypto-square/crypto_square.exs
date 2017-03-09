defmodule CryptoSquare do
  @doc """
  Encode string square methods
  ## Examples

    iex> CryptoSquare.encode("abcd")
    "ac bd"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(string) do
    string
    |> normalize
    |> to_rectangle
    |> transpose
    |> encipher
  end

  @doc """
  Removes non-word characters and downcase a string.

  ## Examples

      iex> CryptoSquare.normalize(" ExerCi sm !!!")
      "exercism"
  """
  @spec normalize(String.t) :: String.t
  def normalize(string) do
    string
    |> String.replace(~r/\W/, "")
    |> String.downcase
  end

  @doc """
  Creates a matrix of characters in a string.
  Matrix has n columns, where n is ceiling of string length sqrt.

  ## Examples

      iex> CryptoSquare.to_rectangle("exercism")
      [["e", "x", "e"], ["r", "c", "i"], ["s", "m", ""]]
  """
  @spec to_rectangle(String.t) :: [[String.t]]
  def to_rectangle(normalized) do
    columns = normalized |> byte_size |> :math.sqrt |> Float.ceil |> round

    normalized
    |> String.graphemes
    |> Enum.chunk(columns, columns, List.duplicate("", columns))
  end

  @doc ~S"""
  Transposes matrix rows into columns.

  ## Examples

      iex> CryptoSquare.transpose([["e", "x", "e"], ["r", "c", "i"], ["s", "m", ""]])
      [["e", "r", "s"], ["x", "c", "m"], ["e", "i", ""]]
  """
  @spec transpose([[String.t]]) :: [[String.t]]
  def transpose(rows) do
    rows
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end

  @doc """
  Creates ciphered string from lists of characters (columns of square).

  ## Examples

      iex> CryptoSquare.encipher([["e", "r", "s"], ["x", "c", "m"], ["e", "i", ""]])
      "ers xcm ei"
  """
  @spec encipher([[String.t]]) :: String.t
  def encipher(columns) do
    columns
    |> Enum.map(&Enum.join/1)
    |> Enum.join(" ")
  end
end
