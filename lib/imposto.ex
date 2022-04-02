##AS5
defmodule Imposto do
  def deducao_irpf_alternativo(base) do
    cond do
      base >= 0.00 and base < 1903.98 ->
        0.00

      base >= 1903.98 and base < 2826.65 ->
        142.80

      base >= 2826.65 and base < 3751.06 ->
        354.80

      base >= 3751.06 and base < 4664.68 ->
        636.13

      base >= 4664.68 and is_number(base) ->
        869.36

      true ->
        :valor_invalido
    end
  end

  def deducao_irpf(base) when base < 0 or not is_number(base) do
    :valor_invalido
  end

  def deducao_irpf(base) when base < 1903.98, do: 0.00
  def deducao_irpf(base) when base >= 1903.98 and base < 2826.65, do: 142.80
  def deducao_irpf(base) when base >= 2826.65 and base < 3751.06, do: 354.80
  def deducao_irpf(base) when base >= 3751.06 and base < 4664.68, do: 636.13
  def deducao_irpf(base) when base >= 4664.68, do: 869.36
end
