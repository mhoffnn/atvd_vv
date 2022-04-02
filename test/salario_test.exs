##AS8
defmodule SalarioTest do
  use ExUnit.Case
  doctest Salario

  test "refute test calc" do
    refute Salario.calc() == :doing
  end

  test "user don't have name informations" do
    assert %{
             email: "matheus@mail.com",
             base_salary: 1200,
             office: :dev
           }
           |> Salario.calc() == :missing_information
  end

  test "user don't have email informations" do
    assert %{
             name: "Matheus",
             base_salary: 1200,
             office: :dev
           }
           |> Salario.calc() == :missing_information
  end

  test "user don't have base salary informations" do
    assert %{
             name: "Matheus",
             email: "matheus@mail.com",
             office: :dev
           }
           |> Salario.calc() == :missing_information
  end

  test "user don't have office informations" do
    assert %{
             name: "Matheus",
             email: "matheus@mail.com",
             base_salary: 1200
           }
           |> Salario.calc() == :missing_information
  end

  test "user have name invalid" do
    assert %{
             name: "Mt",
             email: "matheus@mail.com",
             base_salary: 1200,
             office: :dev
           }
           |> Salario.calc() == :informations_invalid
  end

  test "user have email invalid" do
    assert %{
             name: "Mat",
             email: "matheusmailcom",
             base_salary: 1200,
             office: :dev
           }
           |> Salario.calc() == :informations_invalid
  end

  test "user have base salary invalid" do
    assert %{
             name: "Mat",
             email: "matheus@mail.com",
             base_salary: -1,
             office: :dev
           }
           |> Salario.calc() == :informations_invalid
  end

  test "user have office invalid" do
    assert %{
             name: "Mat",
             email: "matheus@mail.com",
             base_salary: 1200,
             office: :d
           }
           |> Salario.calc() == :informations_invalid
  end

  test "dev with salary smaller then 3.000" do
    assert %{
             name: "Mat",
             email: "matheus@mail.com",
             base_salary: 2999.99,
             office: :dev
           }
           |> Salario.calc() == 2699.99
  end

  test "dev with salary bigger then 3.000" do
    assert %{
             name: "Mat",
             email: "matheus@mail.com",
             base_salary: 3000,
             office: :dev
           }
           |> Salario.calc() == 2400
  end

  test "dba with salary smaller then 2.000" do
    assert %{
             name: "Mat",
             email: "matheus@mail.com",
             base_salary: 1999.99,
             office: :dba
           }
           |> Salario.calc() == 1699.99
  end

  test "dba with salary bigger then 2.000" do
    assert %{
             name: "Mat",
             email: "matheus@mail.com",
             base_salary: 2000,
             office: :dba
           }
           |> Salario.calc() == 1500
  end

  test "tst with salary smaller then 2.000" do
    assert %{
             name: "Mat",
             email: "matheus@mail.com",
             base_salary: 1999.99,
             office: :tst
           }
           |> Salario.calc() == 1699.99
  end

  test "tst with salary bigger then 2.000" do
    assert %{
             name: "Mat",
             email: "matheus@mail.com",
             base_salary: 2000,
             office: :tst
           }
           |> Salario.calc() == 1500
  end

  test "ger with salary smaller then 5.000" do
    assert %{
             name: "Mat",
             email: "matheus@mail.com",
             base_salary: 4999.99,
             office: :ger
           }
           |> Salario.calc() == 3999.99
  end

  test "ger with salary bigger then 5.000" do
    assert %{
             name: "Mat",
             email: "matheus@mail.com",
             base_salary: 5000,
             office: :ger
           }
           |> Salario.calc() == 3500
  end
end
