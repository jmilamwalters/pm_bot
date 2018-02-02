require IEx
require Logger
import HTTPotion
import Poison

defmodule PmBotWeb.PayloadController do
  use PmBotWeb, :controller
  
  def index(conn, _params) do
    render conn, "index.html"
  end

  # def is_issue_self_assigned?() do end

  # def did_dev_comment?() do end

  # def post_to_github() do
  # end

  def on_post(conn, _params) do
    Logger.debug inspect(conn)
    url = 'https://jmilamwalters:xxx!@api.github.com/repos/jmilamwalters/pm_bot/issues/3/comments'
    options = [
      headers: [
        'Accept': 'application/vnd.github.VERSION.text+json',
        'User-Agent': 'jmilamwalters',
      ],
      body: "{\"body\": \"Me too\"}",
    ]
    resp = HTTPotion.request(:post, url, options) 
    IEx.pry
    render conn, "index.html"
  end
end
