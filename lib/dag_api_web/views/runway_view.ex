defmodule DagApiWeb.RunwayView do
  use DagApiWeb, :view
  alias DagApiWeb.RunwayView

  def render("index.json", %{runways: runways}) do
    %{data: render_many(runways, RunwayView, "runway.json")}
  end

  def render("show.json", %{runway: runway}) do
    %{data: render_one(runway, RunwayView, "runway.json")}
  end

  def render("runway.json", %{runway: runway}) do
    %{
      id: runway.id,
      airport_ident: runway.airport_ident,
      length_ft: runway.length_ft,
      width_ft: runway.width_ft,
      surface: runway.surface,
      lighted: runway.lighted,
      closed: runway.closed,
      le_ident: runway.le_ident,
      le_latitude_deg: runway.le_latitude_deg,
      le_longitude_deg: runway.le_longitude_deg,
      le_elevation_ft: runway.le_elevation_ft,
      le_heading_degT: runway.le_heading_degT,
      le_displaced_threshold_ft: runway.le_displaced_threshold_ft,
      he_ident: runway.he_ident,
      he_latitude_deg: runway.he_latitude_deg,
      he_longitude_deg: runway.he_longitude_deg,
      he_elevation_ft: runway.he_elevation_ft,
      he_heading_degT: runway.he_heading_degT,
      he_displaced_threshold_ft: runway.he_displaced_threshold_ft
    }
  end
end
