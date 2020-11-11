defmodule Shibr.DogCeo do
  @moduledoc """
    Wrappers for the dog.ceo api
  """
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://dog.ceo/api"
  plug Tesla.Middleware.JSON

  @default_breed "shiba"
  def get_random_dog(breed \\ @default_breed) do
    reply = get("/breed/" <> breed <> "/images/random")
    case reply do
      {:ok, %{body: body, status: 200}} ->
        {:ok, body["message"]}
      _ ->
        {:error, "Something went wrong fetching our dog image"}
        Loggger.info("[#{__MODULE__} Something went wrong fetching our dog image") # TODO better error message
    end
  end

  def get_breeds() do
  end
end