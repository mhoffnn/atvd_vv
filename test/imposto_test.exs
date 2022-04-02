##AS5
defmodule ImpostoTest do
  use ExUnit.Case
  doctest Imposto

  test "invalid value" do
    assert Imposto.deducao_irpf(-1) == :valor_invalido
  end

  test "invalid type" do
    assert Imposto.deducao_irpf('abc') == :valor_invalido
  end

  test "invalid value alternative" do
    assert Imposto.deducao_irpf_alternativo(-1) == :valor_invalido
  end

  test "invalid typealternative" do
    assert Imposto.deducao_irpf_alternativo('abc') == :valor_invalido
  end

  test "isento" do
    assert Imposto.deducao_irpf(0.01) == 0.00
  end

  test "isento alternative" do
    assert Imposto.deducao_irpf_alternativo(1903.97) == 0.00
  end

  test "salario 1" do
    assert Imposto.deducao_irpf(1903.98) == 142.80
  end

  test "salario 1 alternative" do
    assert Imposto.deducao_irpf_alternativo(2826.64) == 142.80
  end

  test "salario 2" do
    assert Imposto.deducao_irpf(2826.65) == 354.80
  end

  test "salario 2 alternative" do
    assert Imposto.deducao_irpf_alternativo(3751.05) == 354.80
  end

  test "salario 3" do
    assert Imposto.deducao_irpf(3751.06) == 636.13
  end

  test "salario 3 alternative" do
    assert Imposto.deducao_irpf_alternativo(4664.67) == 636.13
  end

  test "maximo" do
    assert Imposto.deducao_irpf(4664.68) == 869.36
  end

  test "maximo alternative" do
    assert Imposto.deducao_irpf_alternativo(4664.68) == 869.36
  end
end
