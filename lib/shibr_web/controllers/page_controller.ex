defmodule ShibrWeb.PageController do
  use ShibrWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
