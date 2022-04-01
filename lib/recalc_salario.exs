defmodule RecalcSalario do
  def calc(%{name: name, email: email, base_salary: base, office: office}) do
    cond do
      name == "" ->
        :user_invalid

      email == "" ->
        :user_invalid

      base == nil ->
        :user_invalid

      office == nil ->
        :user_invalid

      true ->
        :user_valid
    end
  end
end
