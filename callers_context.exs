defmodule Mod do
  defmacro definfo do
    IO.puts("In macro's context (#{__MODULE__}.")

    quote do
      def test2 do
        "hello from test number 2"
      end
    end

    quote do
      IO.puts("In macro's context (#{__MODULE__}.")

      def friendly_info do
        IO.puts("""
        My name is #{__MODULE__}
        My functions are #{inspect(__info__(:functions))}
        Running test #{test()}
        """)
      end
    end
  end
end

defmodule MyModule do
  require Mod

  def test do
    "hello from test"
  end

  Mod.definfo()
end
