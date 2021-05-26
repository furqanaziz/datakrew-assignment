defmodule DagApi.Airports.Runway do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :integer, autogenerate: false}

  schema "runways" do
    field :airport_ident, :string
    field :closed, :boolean, default: false
    field :he_displaced_threshold_ft, :integer
    field :he_elevation_ft, :integer
    field :he_heading_degT, :float
    field :he_ident, :string
    field :he_latitude_deg, :float
    field :he_longitude_deg, :float
    field :le_displaced_threshold_ft, :integer
    field :le_elevation_ft, :integer
    field :le_heading_degT, :float
    field :le_ident, :string
    field :le_latitude_deg, :float
    field :le_longitude_deg, :float
    field :length_ft, :integer
    field :lighted, :boolean, default: false
    field :surface, :string
    field :width_ft, :integer
    field :airport_ref, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(runway, attrs) do
    runway
    |> cast(attrs, [
      :id,
      :airport_ident,
      :length_ft,
      :width_ft,
      :surface,
      :lighted,
      :closed,
      :le_ident,
      :le_latitude_deg,
      :le_longitude_deg,
      :le_elevation_ft,
      :le_heading_degT,
      :le_displaced_threshold_ft,
      :he_ident,
      :he_latitude_deg,
      :he_longitude_deg,
      :he_elevation_ft,
      :he_heading_degT,
      :he_displaced_threshold_ft
    ])
    |> validate_required([
      :id,
      :airport_ident,
      :length_ft,
      :width_ft,
      :surface,
      :lighted,
      :closed,
      :le_ident
    ])
    |> foreign_key_constraint(:airport_ref)
  end
end
