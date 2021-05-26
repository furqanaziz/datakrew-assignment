defmodule DagApiWeb.AirportView do
  use DagApiWeb, :view
  alias DagApiWeb.AirportView

  def render("index.json", %{airports: airports}) do
    %{data: render_many(airports, AirportView, "airport.json")}
  end

  def render("show.json", %{airport: airport}) do
    %{data: render_one(airport, AirportView, "airport.json")}
  end

  def render("airport.json", %{airport: airport}) do
    %{
      id: airport.id,
      ident: airport.ident,
      type: airport.type,
      name: airport.name,
      latitude_deg: airport.latitude_deg,
      longitude_deg: airport.longitude_deg,
      elevation_ft: airport.elevation_ft,
      continent: airport.continent,
      iso_country: airport.iso_country,
      iso_region: airport.iso_region,
      municipality: airport.municipality,
      scheduled_service: airport.scheduled_service,
      gps_code: airport.gps_code,
      iata_code: airport.iata_code,
      local_code: airport.local_code,
      home_link: airport.home_link,
      wikipedia_link: airport.wikipedia_link,
      keywords: airport.keywords
    }
  end
end
