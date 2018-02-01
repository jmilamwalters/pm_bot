defmodule PmBotWeb.PayloadController do
  require Logger
  use PmBotWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def on_post(conn, _params) do
    Logger.debug inspect(conn)
    render conn, "index.html"
  end
end
