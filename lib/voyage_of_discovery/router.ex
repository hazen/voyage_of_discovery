defmodule VoyageOfDiscovery.Router do
  use Plug.Router
  use Plug.ErrorHandler

  alias VoyageOfDiscovery.Plug.VerifyRequest

  plug(Plug.Parsers, parsers: [:urlencoded, :multipart])
  plug(VerifyRequest, fields: ["content", "mimetype"], paths: ["/upload"])
  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Welcome!\n")
  end

  match "/boo" do
    send_resp(conn, 404, "🎃\n")
  end

  match "/upload" do
    send_resp(conn, 201, "⬆️\n")
  end

  match _ do
    send_resp(conn, 404, "Ooops!\n")
  end

  defp handle_errors(conn, %{kind: kind, reason: reason, stack: stack}) do
    IO.inspect(kind, label: :kind)
    IO.inspect(reason, label: :reason)
    IO.inspect(stack, label: :stack)
    send_resp(conn, conn.status, "Something went wrong")
  end
end
