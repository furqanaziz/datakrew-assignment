defmodule DagApi.Repo do
  use Ecto.Repo,
    otp_app: :dag_api,
    adapter: Ecto.Adapters.Postgres
end
