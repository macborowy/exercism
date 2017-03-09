defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]
  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    validate([nucleotide | strand])

    strand
      |> Enum.count(&(&1 == nucleotide))
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    validate(strand)

    @nucleotides
      |> Map.new(fn x -> {x, count(strand, x)} end)
  end

  def validate(list) do
    if Enum.uniq(list) -- @nucleotides !== [], do: raise ArgumentError
  end
end
