defmodule HighSchoolSweetheart do
  def first_letter(str) do
    str
    |> String.trim()
    |> String.first()
  end

  def initial(name) do
    name
    |> first_letter()
    |> String.upcase()
    |> Kernel.<>(".")
  end

  def initials(name) do
    [first, last] = String.split(name, " ")
    initial(first) <> " " <> initial(last)
  end

  def pair(first, second) do
    """
    ❤-------------------❤
    |  #{initials(first)}  +  #{initials(second)}  |
    ❤-------------------❤
    """
  end
end
