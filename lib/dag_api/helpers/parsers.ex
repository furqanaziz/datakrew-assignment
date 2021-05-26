defmodule DagApi.Helpers.Parsers do
  def parse_number(string) when is_binary(string) do
    case Integer.parse(string) do
      {int, ""} ->
        int

      {int, decimal} ->
        float = parse_float("0#{decimal}")
        unless is_nil(float), do: int + float, else: int

      :error ->
        nil
    end
  end

  def parse_float(string) when is_binary(string) do
    case Float.parse(string) do
      {float, _} -> float
      :error -> nil
    end
  end

  def parse_string(""), do: nil
  def parse_string(string), do: string

  def parse_bool("1"), do: true
  def parse_bool("0"), do: false
  def parse_bool(_), do: nil
end
