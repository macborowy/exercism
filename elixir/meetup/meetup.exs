defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """
  @days %{monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday: 7}
  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    possible_dates(year, month, schedule)
    |> Enum.map(&{year, month, &1})
    |> Enum.find(&is_correct_weekday?(&1, weekday))
  end

  @spec possible_dates(pos_integer, pos_integer, schedule) :: Range.t
  def possible_dates(year, month, schedule) do
    last_day_of_the_month = :calendar.last_day_of_the_month(year, month)
    last_week = (last_day_of_the_month - 6)..last_day_of_the_month

    case schedule do
      :first -> 1..7
      :second -> 8..14
      :third -> 15..21
      :fourth -> 22..28
      :teenth -> 13..19
      :last -> last_week
    end
  end

  @spec is_correct_weekday?(:calendar.date, weekday) :: boolean
  def is_correct_weekday?(date, weekday) do
    :calendar.day_of_the_week(date) == @days[weekday]
  end
end
