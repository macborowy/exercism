defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &translate/1)
  end

  @spec translate(char) :: char
  def translate(nucleotide) do
    case nucleotide do
      ?A -> ?U
      ?C -> ?G
      ?G -> ?C
      ?T -> ?A
    end
  end
end
