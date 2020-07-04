defmodule TypeCheck.TypeError.FormatterTest do
  use ExUnit.Case
  use ExUnitProperties
  import StreamData, only: []

  import TypeCheck.Type.StreamData

  property "the default formatter is able to handle all problem tuples (returning a binary string message)" do
    check all problem <- to_gen(TypeCheck.TypeError.Formatter.problem_tuple()) do
      result = TypeCheck.TypeError.DefaultFormatter.format_wrap(problem)
      assert is_binary(result)
    end
  end
end
