defmodule Shibr.Dogs do
  @moduledoc """
  The Dogs context.
  """

  import Ecto.Query, warn: false
  alias Shibr.Repo

  alias Shibr.Dogs.DogHistory

  @doc """
  Returns the list of dog_histories.

  ## Examples

      iex> list_dog_histories()
      [%DogHistory{}, ...]

  """
  def list_dog_histories do
    Repo.all(DogHistory)
  end

  @doc """
  Gets a single dog_history.

  Raises `Ecto.NoResultsError` if the Dog history does not exist.

  ## Examples

      iex> get_dog_history!(123)
      %DogHistory{}

      iex> get_dog_history!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dog_history!(id), do: Repo.get!(DogHistory, id)

  @doc """
  Creates a dog_history.

  ## Examples

      iex> create_dog_history(%{field: value})
      {:ok, %DogHistory{}}

      iex> create_dog_history(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dog_history(attrs \\ %{}) do
    %DogHistory{}
    |> DogHistory.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dog_history.

  ## Examples

      iex> update_dog_history(dog_history, %{field: new_value})
      {:ok, %DogHistory{}}

      iex> update_dog_history(dog_history, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dog_history(%DogHistory{} = dog_history, attrs) do
    dog_history
    |> DogHistory.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dog_history.

  ## Examples

      iex> delete_dog_history(dog_history)
      {:ok, %DogHistory{}}

      iex> delete_dog_history(dog_history)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dog_history(%DogHistory{} = dog_history) do
    Repo.delete(dog_history)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dog_history changes.

  ## Examples

      iex> change_dog_history(dog_history)
      %Ecto.Changeset{data: %DogHistory{}}

  """
  def change_dog_history(%DogHistory{} = dog_history, attrs \\ %{}) do
    DogHistory.changeset(dog_history, attrs)
  end
end
