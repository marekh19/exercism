defmodule FreelancerRates do
  @days_in_month 22.0
  @hours_in_day 8.0

  def daily_rate(hourly_rate), do: @hours_in_day * hourly_rate

  def apply_discount(amount, discount_percent) do
    amount * (1 - discount_percent / 100)
  end

  def monthly_rate(hourly_rate, discount_percent) do
    hourly_rate
    |> daily_rate()
    |> Kernel.*(@days_in_month)
    |> apply_discount(discount_percent)
    |> Kernel.ceil()
  end

  def days_in_budget(budget, hourly_rate, discount_percent) do
    budget
    |> Kernel./(monthly_rate(hourly_rate, discount_percent))
    |> Kernel.*(@days_in_month)
    |> Float.floor(1)
  end
end
