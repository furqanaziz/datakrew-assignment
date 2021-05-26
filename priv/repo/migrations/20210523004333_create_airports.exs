defmodule DagApi.Repo.Migrations.CreateAirports do
  use Ecto.Migration

  def change do
    create table(:airports) do
      add :id, :integer, primary_key: true
      add :ident, :string
      add :type, :string
      add :name, :string
      add :latitude_deg, :float
      add :longitude_deg, :float
      add :elevation_ft, :integer
      add :continent, :string
      add :iso_country, :string
      add :iso_region, :string
      add :municipality, :string
      add :scheduled_service, :string
      add :gps_code, :string
      add :iata_code, :string
      add :local_code, :string
      add :home_link, :string
      add :wikipedia_link, :string
      add :keywords, :text

      timestamps()
    end
  end
end
