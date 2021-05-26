# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DagApi.Repo.insert!(%DagApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

import DagApi.Helpers.Parsers
alias DagApi.Airports
alias DagApi.Airports.{Airport, Runway}

# Seeding Airports
File.stream!("priv/repo/airports.csv")
|> CSV.decode!()
|> Stream.drop(1)
|> Stream.map(fn [
                   id,
                   ident,
                   type,
                   name,
                   latitude_deg,
                   longitude_deg,
                   elevation_ft,
                   continent,
                   iso_country,
                   iso_region,
                   municipality,
                   scheduled_service,
                   gps_code,
                   iata_code,
                   local_code,
                   home_link,
                   wikipedia_link,
                   keywords
                 ] ->
  {:ok, datetime} = DateTime.now("Etc/UTC")
  datetime = DateTime.truncate(datetime, :second)

  %{
    id: parse_number(id),
    ident: parse_string(ident),
    type: parse_string(type),
    name: parse_string(name),
    latitude_deg: parse_float(latitude_deg),
    longitude_deg: parse_float(longitude_deg),
    elevation_ft: parse_number(elevation_ft),
    continent: parse_string(continent),
    iso_country: parse_string(iso_country),
    iso_region: parse_string(iso_region),
    municipality: parse_string(municipality),
    scheduled_service: parse_string(scheduled_service),
    gps_code: parse_string(gps_code),
    iata_code: parse_string(iata_code),
    local_code: parse_string(local_code),
    home_link: parse_string(home_link),
    wikipedia_link: parse_string(wikipedia_link),
    keywords: parse_string(keywords),
    inserted_at: datetime,
    updated_at: datetime
  }
end)
|> Stream.chunk_every(100)
|> Enum.each(fn chunks ->
  Ecto.Multi.new()
  |> Ecto.Multi.insert_all(
    :insert_all,
    Airport,
    chunks
  )
  |> DagApi.Repo.transaction()
end)

# Seeding Runways
File.stream!("priv/repo/runways.csv")
|> CSV.decode!()
|> Stream.drop(1)
|> Stream.map(fn [
                   id,
                   airport_ref,
                   airport_ident,
                   length_ft,
                   width_ft,
                   surface,
                   lighted,
                   closed,
                   le_ident,
                   le_latitude_deg,
                   le_longitude_deg,
                   le_elevation_ft,
                   le_heading_degT,
                   le_displaced_threshold_ft,
                   he_ident,
                   he_latitude_deg,
                   he_longitude_deg,
                   he_elevation_ft,
                   he_heading_degT,
                   he_displaced_threshold_ft
                 ] ->
  {:ok, datetime} = DateTime.now("Etc/UTC")
  datetime = DateTime.truncate(datetime, :second)

  %{
    id: parse_number(id),
    airport_ref: parse_number(airport_ref),
    airport_ident: parse_string(airport_ident),
    length_ft: parse_number(length_ft),
    width_ft: parse_number(width_ft),
    surface: parse_string(surface),
    lighted: parse_bool(lighted),
    closed: parse_bool(closed),
    le_ident: parse_string(le_ident),
    le_latitude_deg: parse_float(le_latitude_deg),
    le_longitude_deg: parse_float(le_longitude_deg),
    le_elevation_ft: parse_number(le_elevation_ft),
    le_heading_degT: parse_float(le_heading_degT),
    le_displaced_threshold_ft: parse_number(le_displaced_threshold_ft),
    he_ident: parse_string(he_ident),
    he_latitude_deg: parse_float(he_latitude_deg),
    he_longitude_deg: parse_float(he_longitude_deg),
    he_elevation_ft: parse_number(he_elevation_ft),
    he_heading_degT: parse_float(he_heading_degT),
    he_displaced_threshold_ft: parse_number(he_displaced_threshold_ft),
    inserted_at: datetime,
    updated_at: datetime
  }
end)
|> Stream.chunk_every(100)
|> Enum.each(fn chunks ->
  Ecto.Multi.new()
  |> Ecto.Multi.insert_all(
    :insert_all,
    Runway,
    Enum.reject(chunks, fn chunk -> Airports.get_airport(chunk.airport_ref) == nil end)
  )
  |> DagApi.Repo.transaction()
end)
