defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    splits = sentence 
      |> String.downcase
      |> String.split(~r{[\s_,:!&@$%^&]})
      |> Enum.filter(&(String.length(&1) > 0))

    splits
      |> Enum.uniq
      |> Enum.map(&{&1, Enum.count(splits, fn word -> word == &1 end)})
      |> Map.new
  end
end
