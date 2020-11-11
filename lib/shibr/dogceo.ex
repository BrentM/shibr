defmodule Shibr.DogCeo do
  @moduledoc """
    Wrappers for the dog.ceo api
  """
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://dog.ceo/api"
  plug Tesla.Middleware.JSON

  require Logger

  @default_breed "shiba"
  def get_random_dog(breed \\ @default_breed) do
    reply = get("/breed/" <> breed <> "/images/random")
    case reply do
      {:ok, %{body: body, status: 200}} ->
        {:ok, body["message"]}
      _ ->
        {:error, "Something went wrong fetching our dog image"}
        Logger.info("[#{__MODULE__} Something went wrong fetching our dog image") # TODO better error message
    end
  end

  def get_breed_names() do
    reply = get("/breeds/list/all")
    case reply do # TODO We've done this twice now so we could look at generalizing it... but not right now.
      {:ok, %{body: body, status: 200}} ->
        {:ok, Map.keys(body["message"])}
      _ ->
        {:error, "Something went wrong fetching dog breeds"}
        Logger.info("[#{__MODULE__} Something went wrong fetching dog breeds") # TODO better error message
    end
  end
end