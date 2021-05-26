defmodule DagApiWeb.AirportControllerTest do
  use DagApiWeb.ConnCase

  alias DagApi.Airports
  alias DagApi.Airports.Airport

  @create_attrs %{
    continent: "some continent",
    elevation_ft: "some elevation_ft",
    gps_code: "some gps_code",
    home_link: "some home_link",
    iata_code: "some iata_code",
    id: 42,
    ident: "some ident",
    iso_country: "some iso_country",
    iso_region: "some iso_region",
    keywords: "some keywords",
    latitude_deg: 42,
    local_code: "some local_code",
    longitude_deg: 42,
    municipality: "some municipality",
    name: "some name",
    scheduled_service: "some scheduled_service",
    type: "some type",
    wikipedia_link: "some wikipedia_link"
  }
  @update_attrs %{
    continent: "some updated continent",
    elevation_ft: "some updated elevation_ft",
    gps_code: "some updated gps_code",
    home_link: "some updated home_link",
    iata_code: "some updated iata_code",
    id: 43,
    ident: "some updated ident",
    iso_country: "some updated iso_country",
    iso_region: "some updated iso_region",
    keywords: "some updated keywords",
    latitude_deg: 42,
    local_code: "some updated local_code",
    longitude_deg: 42,
    municipality: "some updated municipality",
    name: "some updated name",
    scheduled_service: "some updated scheduled_service",
    type: "some updated type",
    wikipedia_link: "some updated wikipedia_link"
  }
  @invalid_attrs %{
    continent: nil,
    elevation_ft: nil,
    gps_code: nil,
    home_link: nil,
    iata_code: nil,
    id: nil,
    ident: nil,
    iso_country: nil,
    iso_region: nil,
    keywords: nil,
    latitude_deg: nil,
    local_code: nil,
    longitude_deg: nil,
    municipality: nil,
    name: nil,
    scheduled_service: nil,
    type: nil,
    wikipedia_link: nil
  }

  def fixture(:airport) do
    {:ok, airport} = Airports.create_airport(@create_attrs)
    airport
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  # describe "index" do
  #   test "lists all airports", %{conn: conn} do
  #     conn = get(conn, Routes.airport_path(conn, :index))
  #     assert json_response(conn, 200)["data"] == []
  #   end
  # end

  # describe "create airport" do
  #   test "renders airport when data is valid", %{conn: conn} do
  #     conn = post(conn, Routes.airport_path(conn, :create), airport: @create_attrs)
  #     assert %{"id" => id} = json_response(conn, 201)["data"]

  #     conn = get(conn, Routes.airport_path(conn, :show, id))

  #     assert %{
  #              "continent" => "some continent",
  #              "elevation_ft" => "some elevation_ft",
  #              "gps_code" => "some gps_code",
  #              "home_link" => "some home_link",
  #              "iata_code" => "some iata_code",
  #              "id" => 42,
  #              "ident" => "some ident",
  #              "iso_country" => "some iso_country",
  #              "iso_region" => "some iso_region",
  #              "keywords" => "some keywords",
  #              "latitude_deg" => "some latitude_deg",
  #              "local_code" => "some local_code",
  #              "longitude_deg" => "some longitude_deg",
  #              "municipality" => "some municipality",
  #              "name" => "some name",
  #              "scheduled_service" => "some scheduled_service",
  #              "type" => "some type",
  #              "wikipedia_link" => "some wikipedia_link"
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn} do
  #     conn = post(conn, Routes.airport_path(conn, :create), airport: @invalid_attrs)
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  describe "update airport" do
    setup [:create_airport]

    test "renders airport when data is valid", %{conn: conn, airport: %Airport{id: id} = airport} do
      conn = put(conn, Routes.airport_path(conn, :update, airport), airport: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.airport_path(conn, :show, id))

      assert %{
               "continent" => "some updated continent",
               "elevation_ft" => "some updated elevation_ft",
               "gps_code" => "some updated gps_code",
               "home_link" => "some updated home_link",
               "iata_code" => "some updated iata_code",
               "id" => 43,
               "ident" => "some updated ident",
               "iso_country" => "some updated iso_country",
               "iso_region" => "some updated iso_region",
               "keywords" => "some updated keywords",
               "latitude_deg" => "some updated latitude_deg",
               "local_code" => "some updated local_code",
               "longitude_deg" => "some updated longitude_deg",
               "municipality" => "some updated municipality",
               "name" => "some updated name",
               "scheduled_service" => "some updated scheduled_service",
               "type" => "some updated type",
               "wikipedia_link" => "some updated wikipedia_link"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, airport: airport} do
      conn = put(conn, Routes.airport_path(conn, :update, airport), airport: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  # describe "delete airport" do
  #   setup [:create_airport]

  #   test "deletes chosen airport", %{conn: conn, airport: airport} do
  #     conn = delete(conn, Routes.airport_path(conn, :delete, airport))
  #     assert response(conn, 204)

  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.airport_path(conn, :show, airport))
  #     end
  #   end
  # end

  defp create_airport(_) do
    airport = fixture(:airport)
    %{airport: airport}
  end
end
