defmodule ShibrWeb.PageController do
  use ShibrWeb, :controller

  require Logger

  def index(conn, params) when not is_map_key(params, "breed"), do: index(conn, Map.put(params, "breed", "shiba"))
  def index(conn, params) do
    Logger.debug(inspect params)
    {:ok, breeds} = Shibr.DogCeo.get_breed_names()
    breed = if params["breed"] in breeds do
      params["breed"]
    else
      "shiba" # TODO lets just fall back to our default for now. We can probably handle this better but it's a product call.
    end
    {:ok, main_dog} = Shibr.DogCeo.get_random_dog(breed)
    render(conn, "index.html", [main_dog: main_dog, breed: breed, breeds: breeds])
  end
end
