defmodule KitchenCalculator do
  def get_volume({_, vol}), do: vol

  def to_milliliter({unit, volume}) do
    case unit do
      :cup -> {:milliliter, volume * 240}
      :fluid_ounce -> {:milliliter, volume * 30}
      :teaspoon -> {:milliliter, volume * 5}
      :tablespoon -> {:milliliter, volume * 15}
      :milliliter -> {unit, volume}
    end
  end

  def from_milliliter({_, volume}, unit) do
    case unit do
      :cup -> {:cup, volume / 240}
      :fluid_ounce -> {:fluid_ounce, volume / 30}
      :teaspoon -> {:teaspoon, volume / 5}
      :tablespoon -> {:tablespoon, volume / 15}
      :milliliter -> {unit, volume}
    end
  end

  def convert({from, volume}, to) do
    {from, volume}
    |> to_milliliter()
    |> from_milliliter(to)
  end
end
