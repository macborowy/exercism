defmodule Wordy do

  @doc """
  Calculate the math problem in the sentence.
  """
  @spec answer(String.t) :: integer
  def answer("What is " <> question) do
    question
    |> get_operations
    |> compute

    "Excercise has additional requirements - check exercise page!"
  end
  def answer(_), do: raise ArgumentError, message: "Question should start with \"What is ...?\""

  defp get_operations(question, acc \\ [])
  defp get_operations("?", acc), do: Enum.reverse(acc)
  defp get_operations(question, acc) do
    parsed =
      question
      |> String.trim
      |> Integer.parse

    case parsed do
      {number, rest} -> get_operations(rest, [number | acc])
      :error         -> retrive_operation(question, acc)
    end
  end

  defp retrive_operation(question, acc) do
    case String.trim_leading(question) do
      "plus"          <> rest -> get_operations(rest, ["+" | acc])
      "minus"         <> rest -> get_operations(rest, ["-" | acc])
      "multiplied by" <> rest -> get_operations(rest, ["*" | acc])
      "divided by"    <> rest -> get_operations(rest, ["/" | acc])
      _                       -> raise ArgumentError, message: "Unknown operation"
    end
  end

  defp compute(number, acc \\ 0)
  defp compute([], acc), do: acc
  defp compute([number | tail], acc) when is_number(number),
    do: compute(tail, acc + number)
  defp compute([operation, number | tail], acc) when is_binary(operation) and is_number(number) do
    case operation do
      "+" -> compute(tail, acc + number)
      "-" -> compute(tail, acc - number)
      "*" -> compute(tail, acc * number)
      "/" -> compute(tail, acc / number)
      _   -> raise ArgumentError, message: "Unknown operation"
    end
  end
  defp compute(_, _), do: {:error, "wrong order of elements in operations list"}
end
