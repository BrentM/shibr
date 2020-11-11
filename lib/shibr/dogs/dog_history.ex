defmodule Shibr.Dogs.DogHistory do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  
  schema "dog_histories" do
    field :breed, :string
    field :url, :string

    timestamps([type: :utc_datetime])
  end

  @doc false
  def changeset(dog_history, attrs) do
    dog_history
    |> cast(attrs, [:breed, :url])
    |> validate_required([:breed, :url])
  end
end
