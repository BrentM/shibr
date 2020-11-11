defmodule Shibr.DogsTest do
  use Shibr.DataCase

  alias Shibr.Dogs

  describe "dog_histories" do
    alias Shibr.Dogs.DogHistory

    @valid_attrs %{breed: "some breed", url: "some url"}
    @update_attrs %{breed: "some updated breed", url: "some updated url"}
    @invalid_attrs %{breed: nil, url: nil}

    def dog_history_fixture(attrs \\ %{}) do
      {:ok, dog_history} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Dogs.create_dog_history()

      dog_history
    end

    test "list_dog_histories/0 returns all dog_histories" do
      dog_history = dog_history_fixture()
      assert Dogs.list_dog_histories() == [dog_history]
    end

    test "get_dog_history!/1 returns the dog_history with given id" do
      dog_history = dog_history_fixture()
      assert Dogs.get_dog_history!(dog_history.id) == dog_history
    end

    test "create_dog_history/1 with valid data creates a dog_history" do
      assert {:ok, %DogHistory{} = dog_history} = Dogs.create_dog_history(@valid_attrs)
      assert dog_history.breed == "some breed"
      assert dog_history.url == "some url"
    end

    test "create_dog_history/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dogs.create_dog_history(@invalid_attrs)
    end

    test "update_dog_history/2 with valid data updates the dog_history" do
      dog_history = dog_history_fixture()
      assert {:ok, %DogHistory{} = dog_history} = Dogs.update_dog_history(dog_history, @update_attrs)
      assert dog_history.breed == "some updated breed"
      assert dog_history.url == "some updated url"
    end

    test "update_dog_history/2 with invalid data returns error changeset" do
      dog_history = dog_history_fixture()
      assert {:error, %Ecto.Changeset{}} = Dogs.update_dog_history(dog_history, @invalid_attrs)
      assert dog_history == Dogs.get_dog_history!(dog_history.id)
    end

    test "delete_dog_history/1 deletes the dog_history" do
      dog_history = dog_history_fixture()
      assert {:ok, %DogHistory{}} = Dogs.delete_dog_history(dog_history)
      assert_raise Ecto.NoResultsError, fn -> Dogs.get_dog_history!(dog_history.id) end
    end

    test "change_dog_history/1 returns a dog_history changeset" do
      dog_history = dog_history_fixture()
      assert %Ecto.Changeset{} = Dogs.change_dog_history(dog_history)
    end
  end
end
