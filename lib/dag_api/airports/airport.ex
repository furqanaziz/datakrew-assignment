defmodule DagApi.Airports.Airport do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :integer, autogenerate: false}

  schema "airports" do
    field :continent, :string
    field :elevation_ft, :integer
    field :gps_code, :string
    field :home_link, :string
    field :iata_code, :string
    field :ident, :string
    field :iso_country, :string
    field :iso_region, :string
    field :keywords, :string
    field :latitude_deg, :float
    field :local_code, :string
    field :longitude_deg, :float
    field :municipality, :string
    field :name, :string
    field :scheduled_service, :string
    field :type, :string
    field :wikipedia_link, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(airport, attrs) do
    airport
    |> cast(attrs, [
      :id,
      :ident,
      :type,
      :name,
      :latitude_deg,
      :longitude_deg,
      :elevation_ft,
      :continent,
      :iso_country,
      :iso_region,
      :municipality,
      :scheduled_service,
      :gps_code,
      :iata_code,
      :local_code,
      :home_link,
      :wikipedia_link,
      :keywords
    ])
    |> validate_required([
      :id,
      :ident,
      :type,
      :name,
      :latitude_deg,
      :longitude_deg,
      :continent,
      :iso_country,
      :iso_region,
      :scheduled_service
    ])
  end
end
