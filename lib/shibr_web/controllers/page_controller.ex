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
      "shiba" # TODO lets just fall back to our default for now. We can probably handle this better but it's a product call that needs some uer input.
    end
    {:ok, main_dog} = Shibr.DogCeo.get_random_dog(breed) # TODO we can handle an error here better but this will get the job done and use the default error handlers when we set them up.
    # Save the dog info to the DB
    # TODO verify the dog image URL is what we expect - prevent bad things from untrusted input. Would do this better given more time. Can be added to the changeset.
    Shibr.Dogs.create_dog_history(%{breed: breed, url: main_dog})
    # Fetch an image URL for each breed
    breed_images = Enum.map(breeds, fn b ->
      {:ok, dog_url} = Shibr.DogCeo.get_random_dog(b)
      %{breed: b, url: dog_url}
    end
    )
    Logger.debug(inspect breed_images)
    render(conn, "index.html", [main_dog: main_dog, breed: breed, breeds: breed_images])
  end
end
