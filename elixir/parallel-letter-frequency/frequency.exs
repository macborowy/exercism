defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency("", _), do: []
  def frequency(texts, workers) when is_list(texts) do
    texts
    |> Enum.join("")
    |> frequency(workers)
  end
  def frequency(string, workers) do
    string
    |> create_chunks(workers)
    |> Enum.map(&do_frequency_async(&1))
    |> Enum.map(&receive_results(&1))
    |> List.flatten
    |> Enum.reduce(%{}, fn {letter, occurences}, map -> Map.update(map, letter, occurences, &(&1 + occurences)) end)
  end

  def create_chunks(text, workers) do
    lines_in_group = groups_length(text, workers)

    text
    |> String.downcase
    |> String.codepoints
    |> Enum.chunk(lines_in_group, lines_in_group, [])
  end

  def groups_length(text, workers) do
    text
    |> byte_size
    |> Kernel./(workers)
    |> Float.ceil
    |> trunc
  end

  defp do_frequency_async(characters) do
    caller = self
    spawn(fn -> send(caller, {:result, get_partial_frequency(characters)}) end)
  end

  defp receive_results(result) do
    receive do
      {:result, list} -> list
    end
  end

  def get_partial_frequency(chunk) do
    chunk
    |> Enum.group_by(&(&1))
    |> Enum.filter(fn {k, _} -> String.match?(k, ~r/\p{L}/) end)
    |> Enum.map(fn {k, occurences} -> {k, length(occurences)} end)
  end
end
