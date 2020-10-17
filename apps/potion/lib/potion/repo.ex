defmodule Potion.Repo do
  use Ecto.Repo,
    otp_app: :potion,
    adapter: Ecto.Adapters.Postgres
end
