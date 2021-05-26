defmodule DagApiWeb.RunwayControllerTest do
  use DagApiWeb.ConnCase

  alias DagApi.Airports
  alias DagApi.Airports.Runway

  @create_attrs %{
    airport_ident: "some airport_ident",
    closed: true,
    he_displaced_threshold_ft: 42,
    he_elevation_ft: 42,
    he_heading_degT: 42,
    he_ident: "some he_ident",
    he_latitude_deg: 42,
    he_longitude_deg: 42,
    id: 42,
    le_displaced_threshold_ft: 42,
    le_elevation_ft: 42,
    le_heading_degT: 42,
    le_ident: "some le_ident",
    le_latitude_deg: "some le_latitude_deg",
    le_longitude_deg: "some le_longitude_deg",
    length_ft: 42,
    lighted: true,
    surface: "some surface",
    width_ft: 42
  }
  @update_attrs %{
    airport_ident: "some updated airport_ident",
    closed: false,
    he_displaced_threshold_ft: 43,
    he_elevation_ft: 43,
    he_heading_degT: 43,
    he_ident: "some updated he_ident",
    he_latitude_deg: 43,
    he_longitude_deg: 43,
    id: 43,
    le_displaced_threshold_ft: 43,
    le_elevation_ft: 43,
    le_heading_degT: 43,
    le_ident: "some updated le_ident",
    le_latitude_deg: "some updated le_latitude_deg",
    le_longitude_deg: "some updated le_longitude_deg",
    length_ft: 43,
    lighted: false,
    surface: "some updated surface",
    width_ft: 43
  }
  @invalid_attrs %{
    airport_ident: nil,
    closed: nil,
    he_displaced_threshold_ft: nil,
    he_elevation_ft: nil,
    he_heading_degT: nil,
    he_ident: nil,
    he_latitude_deg: nil,
    he_longitude_deg: nil,
    id: nil,
    le_displaced_threshold_ft: nil,
    le_elevation_ft: nil,
    le_heading_degT: nil,
    le_ident: nil,
    le_latitude_deg: nil,
    le_longitude_deg: nil,
    length_ft: nil,
    lighted: nil,
    surface: nil,
    width_ft: nil
  }

  def fixture(:runway) do
    {:ok, runway} = Airports.create_runway(@create_attrs)
    runway
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  # describe "index" do
  #   test "lists all runways", %{conn: conn} do
  #     conn = get(conn, Routes.runway_path(conn, :index))
  #     assert json_response(conn, 200)["data"] == []
  #   end
  # end

  # describe "create runway" do
  #   test "renders runway when data is valid", %{conn: conn} do
  #     conn = post(conn, Routes.runway_path(conn, :create), runway: @create_attrs)
  #     assert %{"id" => id} = json_response(conn, 201)["data"]

  #     conn = get(conn, Routes.runway_path(conn, :show, id))

  #     assert %{
  #              "airport_ident" => "some airport_ident",
  #              "closed" => true,
  #              "he_displaced_threshold_ft" => 42,
  #              "he_elevation_ft" => 42,
  #              "he_heading_degT" => 42,
  #              "he_ident" => "some he_ident",
  #              "he_latitude_deg" => 42,
  #              "he_longitude_deg" => 42,
  #              "id" => 42,
  #              "le_displaced_threshold_ft" => 42,
  #              "le_elevation_ft" => 42,
  #              "le_heading_degT" => 42,
  #              "le_ident" => "some le_ident",
  #              "le_latitude_deg" => "some le_latitude_deg",
  #              "le_longitude_deg" => "some le_longitude_deg",
  #              "length_ft" => 42,
  #              "lighted" => true,
  #              "surface" => "some surface",
  #              "width_ft" => 42
  #            } = json_response(conn, 200)["data"]
  #   end

  #   test "renders errors when data is invalid", %{conn: conn} do
  #     conn = post(conn, Routes.runway_path(conn, :create), runway: @invalid_attrs)
  #     assert json_response(conn, 422)["errors"] != %{}
  #   end
  # end

  describe "update runway" do
    setup [:create_runway]

    test "renders runway when data is valid", %{conn: conn, runway: %Runway{id: id} = runway} do
      conn = put(conn, Routes.runway_path(conn, :update, runway), runway: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.runway_path(conn, :show, id))

      assert %{
               "airport_ident" => "some updated airport_ident",
               "closed" => false,
               "he_displaced_threshold_ft" => 43,
               "he_elevation_ft" => 43,
               "he_heading_degT" => 43,
               "he_ident" => "some updated he_ident",
               "he_latitude_deg" => 43,
               "he_longitude_deg" => 43,
               "id" => 43,
               "le_displaced_threshold_ft" => 43,
               "le_elevation_ft" => 43,
               "le_heading_degT" => 43,
               "le_ident" => "some updated le_ident",
               "le_latitude_deg" => "some updated le_latitude_deg",
               "le_longitude_deg" => "some updated le_longitude_deg",
               "length_ft" => 43,
               "lighted" => false,
               "surface" => "some updated surface",
               "width_ft" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, runway: runway} do
      conn = put(conn, Routes.runway_path(conn, :update, runway), runway: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  # describe "delete runway" do
  #   setup [:create_runway]

  #   test "deletes chosen runway", %{conn: conn, runway: runway} do
  #     conn = delete(conn, Routes.runway_path(conn, :delete, runway))
  #     assert response(conn, 204)

  #     assert_error_sent 404, fn ->
  #       get(conn, Routes.runway_path(conn, :show, runway))
  #     end
  #   end
  # end

  defp create_runway(_) do
    runway = fixture(:runway)
    %{runway: runway}
  end
end
