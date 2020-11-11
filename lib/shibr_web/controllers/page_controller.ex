defmodule ShibrWeb.PageController do
  use ShibrWeb, :controller

  def index(conn, _params) do
    {:ok, main_dog} = Shibr.DogCeo.get_random_dog()
    render(conn, "index.html", [main_dog: main_dog])
  end
end
