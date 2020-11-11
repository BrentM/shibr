defmodule ShibrWeb.DogHistoryControllerTest do
  use ShibrWeb.ConnCase

  alias Shibr.Dogs

  @create_attrs %{breed: "some breed", url: "some url"}
  @update_attrs %{breed: "some updated breed", url: "some updated url"}
  @invalid_attrs %{breed: nil, url: nil}

  def fixture(:dog_history) do
    {:ok, dog_history} = Dogs.create_dog_history(@create_attrs)
    dog_history
  end

  describe "index" do
    test "lists all dog_histories", %{conn: conn} do
      conn = get(conn, Routes.dog_history_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Dog histories"
    end
  end

  describe "new dog_history" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.dog_history_path(conn, :new))
      assert html_response(conn, 200) =~ "New Dog history"
    end
  end

  describe "create dog_history" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.dog_history_path(conn, :create), dog_history: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.dog_history_path(conn, :show, id)

      conn = get(conn, Routes.dog_history_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Dog history"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.dog_history_path(conn, :create), dog_history: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Dog history"
    end
  end

  describe "edit dog_history" do
    setup [:create_dog_history]

    test "renders form for editing chosen dog_history", %{conn: conn, dog_history: dog_history} do
      conn = get(conn, Routes.dog_history_path(conn, :edit, dog_history))
      assert html_response(conn, 200) =~ "Edit Dog history"
    end
  end

  describe "update dog_history" do
    setup [:create_dog_history]

    test "redirects when data is valid", %{conn: conn, dog_history: dog_history} do
      conn = put(conn, Routes.dog_history_path(conn, :update, dog_history), dog_history: @update_attrs)
      assert redirected_to(conn) == Routes.dog_history_path(conn, :show, dog_history)

      conn = get(conn, Routes.dog_history_path(conn, :show, dog_history))
      assert html_response(conn, 200) =~ "some updated breed"
    end

    test "renders errors when data is invalid", %{conn: conn, dog_history: dog_history} do
      conn = put(conn, Routes.dog_history_path(conn, :update, dog_history), dog_history: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Dog history"
    end
  end

  describe "delete dog_history" do
    setup [:create_dog_history]

    test "deletes chosen dog_history", %{conn: conn, dog_history: dog_history} do
      conn = delete(conn, Routes.dog_history_path(conn, :delete, dog_history))
      assert redirected_to(conn) == Routes.dog_history_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.dog_history_path(conn, :show, dog_history))
      end
    end
  end

  defp create_dog_history(_) do
    dog_history = fixture(:dog_history)
    %{dog_history: dog_history}
  end
end
