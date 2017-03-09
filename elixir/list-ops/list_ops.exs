defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.


  @spec count(list, integer) :: non_neg_integer
  def count(list, acc \\ 0)

  def count([_|tail], acc), do: count(tail, acc + 1)
  def count([], acc), do: acc


  @spec reverse(list, list) :: list
  def reverse(list, acc \\ [])

  def reverse([head|tail], acc), do: reverse(tail, [head|acc])
  def reverse([], acc), do: acc


  @spec map(list, (any -> any), list) :: list
  def map(list, f, acc \\ [])

  def map([head|tail], f, acc), do: map(tail, f, [f.(head)|acc])
  def map([], _, acc), do: reverse(acc)

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(list, f, acc \\ [])

  def filter([head|tail], f, acc) do
    if f.(head) do
      filter(tail, f, [head|acc])
    else
      filter(tail, f, acc)
    end
  end
  def filter([], _, acc), do: reverse(acc)

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(list, acc, f)

  def reduce([head|tail], acc, f), do: reduce(tail, f.(head, acc), f)
  def reduce([], acc, _), do: acc

  @spec append(list, list) :: list
  def append(a, b) do
    reversed_a = reverse(a)
    do_append(b, reversed_a)
  end

  def do_append([head | tail], acc), do: do_append(tail, [head|acc])
  def do_append([], acc), do: reverse(acc)

  @spec concat([[any]]) :: [any]
  def concat(ll), do: do_concat(ll, []) |> reverse

  def do_concat([], acc), do: acc
  # in case that initial list is not empty, but current head is empty list
  def do_concat([[]|t], acc), do: do_concat(t, acc)
  def do_concat([[h|t] | tail], acc), do: do_concat([t|tail], [h|acc])
end
