defmodule DagApi.Repo.Migrations.CreateRunways do
  use Ecto.Migration

  def change do
    create table(:runways) do
      add :id, :integer, primary_key: true
      add :airport_ident, :string
      add :length_ft, :integer
      add :width_ft, :integer
      add :surface, :string
      add :lighted, :boolean, default: false, null: false
      add :closed, :boolean, default: false, null: false
      add :le_ident, :string
      add :le_latitude_deg, :float
      add :le_longitude_deg, :float
      add :le_elevation_ft, :integer
      add :le_heading_degT, :float
      add :le_displaced_threshold_ft, :integer
      add :he_ident, :string
      add :he_latitude_deg, :float
      add :he_longitude_deg, :float
      add :he_elevation_ft, :integer
      add :he_heading_degT, :float
      add :he_displaced_threshold_ft, :integer
      add :airport_ref, references(:airports, on_delete: :nothing)

      timestamps()
    end

    create index(:runways, [:airport_ref])
  end
end
