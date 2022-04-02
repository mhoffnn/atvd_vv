##AS8
defmodule Salario do
  def calc(), do: :do

  def calc(user) do
    user
    |> is_valid?()
  end

  def is_valid?(
        user = %{
          name: name,
          email: email,
          base_salary: base_salary,
          office: office
        }
      ) do
    name
    |> is_name?()
    |> is_email?(email)
    |> is_salary?(base_salary)
    |> is_office?(office)
    |> rebase_by_office(user)
  end

  def is_valid?(_user), do: :missing_information

  def is_name?(name), do: String.length(name) > 2

  def is_email?(bool, _email) when bool == false, do: bool

  def is_email?(_bool, email) do
    String.contains?(email, "@") and String.contains?(email, ".com")
  end

  def is_salary?(bool, _base_salary) when bool == false, do: bool
  def is_salary?(_bool, base_salary), do: is_number(base_salary) and base_salary > 0

  def is_office?(bool, _office) when bool == false, do: bool

  def is_office?(_bool, office) do
    is_atom(office) and (office == :dev or office == :dba or office == :tst or office == :ger)
  end

  def rebase_by_office(bool, _user) when bool == false, do: :informations_invalid

  def rebase_by_office(_bool, user) do
    rebase(user.base_salary, user.office)
  end

  def rebase(base, :dev) when base < 3000, do: Float.floor(base - percent(base, 10), 2)
  def rebase(base, :dev), do: Float.floor(base - percent(base, 20), 2)

  def rebase(base, :dba) when base < 2000, do: Float.floor(base - percent(base, 15), 2)
  def rebase(base, :dba), do: Float.floor(base - percent(base, 25), 2)

  def rebase(base, :tst) when base < 2000, do: Float.floor(base - percent(base, 15), 2)
  def rebase(base, :tst), do: Float.floor(base - percent(base, 25), 2)

  def rebase(base, :ger) when base < 5000, do: Float.floor(base - percent(base, 20), 2)
  def rebase(base, :ger), do: Float.floor(base - percent(base, 30), 2)

  def percent(base, percent) do
    percent * base / 100
  end
end
