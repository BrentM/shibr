defmodule Shibr.Repo do
  use Ecto.Repo,
    otp_app: :shibr,
    adapter: Ecto.Adapters.Postgres
end
