defmodule PmBotWeb.PageController do
  use PmBotWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
