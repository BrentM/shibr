defmodule ShibrWeb.DogHistoryController do
  use ShibrWeb, :controller

  alias Shibr.Dogs
  alias Shibr.Dogs.DogHistory

  def index(conn, _params) do
    dog_histories = Dogs.list_dog_histories()
    render(conn, "index.html", dog_histories: dog_histories)
  end

  def new(conn, _params) do
    changeset = Dogs.change_dog_history(%DogHistory{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"dog_history" => dog_history_params}) do
    case Dogs.create_dog_history(dog_history_params) do
      {:ok, dog_history} ->
        conn
        |> put_flash(:info, "Dog history created successfully.")
        |> redirect(to: Routes.dog_history_path(conn, :show, dog_history))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dog_history = Dogs.get_dog_history!(id)
    render(conn, "show.html", dog_history: dog_history)
  end

  def edit(conn, %{"id" => id}) do
    dog_history = Dogs.get_dog_history!(id)
    changeset = Dogs.change_dog_history(dog_history)
    render(conn, "edit.html", dog_history: dog_history, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dog_history" => dog_history_params}) do
    dog_history = Dogs.get_dog_history!(id)

    case Dogs.update_dog_history(dog_history, dog_history_params) do
      {:ok, dog_history} ->
        conn
        |> put_flash(:info, "Dog history updated successfully.")
        |> redirect(to: Routes.dog_history_path(conn, :show, dog_history))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", dog_history: dog_history, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dog_history = Dogs.get_dog_history!(id)
    {:ok, _dog_history} = Dogs.delete_dog_history(dog_history)

    conn
    |> put_flash(:info, "Dog history deleted successfully.")
    |> redirect(to: Routes.dog_history_path(conn, :index))
  end
end
