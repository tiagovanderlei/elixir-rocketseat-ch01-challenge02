defmodule ListFilter do
  defp is_integer2({_number, ""}), do: true
  defp is_integer2(:error), do: false
  defp is_integer2({_number, _remainder}), do: false

  defp filter_integer(list),
    do:
      Enum.filter(list, fn element ->
        Integer.parse(element) |> is_integer2
      end)

  defp extract_number({number, _rest}), do: number

  defp convertto_integer(list) do
    Enum.map(list, fn element ->
      element
      |> Integer.parse()
      |> extract_number
    end)
  end

  defp is_odd(value) do
    Integer.mod(value, 2) != 0
  end

  defp count_odd(list) do
    list
    |> filter_integer()
    |> convertto_integer()
    |> Enum.count(fn element -> is_odd(element) end)
  end

  def call(list) do
    list |> count_odd()
  end
end
