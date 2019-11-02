defmodule VoyageOfDiscovery.HelloWorldPlug do
  @moduledoc """
  Straight from https://elixirschool.com/en/lessons/specifics/plug/
  """
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello World!\n")
  end
end
