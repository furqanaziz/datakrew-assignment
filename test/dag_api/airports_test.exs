defmodule DagApi.AirportsTest do
  use DagApi.DataCase

  alias DagApi.Airports

  describe "airports" do
    alias DagApi.Airports.Airport

    @valid_attrs %{
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
      latitude_deg: "some latitude_deg",
      local_code: "some local_code",
      longitude_deg: "some longitude_deg",
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
      latitude_deg: "some updated latitude_deg",
      local_code: "some updated local_code",
      longitude_deg: "some updated longitude_deg",
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

    def airport_fixture(attrs \\ %{}) do
      {:ok, airport} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Airports.create_airport()

      airport
    end

    test "list_airports/0 returns all airports" do
      airport = airport_fixture()
      assert Airports.list_airports() == [airport]
    end

    test "get_airport!/1 returns the airport with given id" do
      airport = airport_fixture()
      assert Airports.get_airport!(airport.id) == airport
    end

    test "create_airport/1 with valid data creates a airport" do
      assert {:ok, %Airport{} = airport} = Airports.create_airport(@valid_attrs)
      assert airport.continent == "some continent"
      assert airport.elevation_ft == "some elevation_ft"
      assert airport.gps_code == "some gps_code"
      assert airport.home_link == "some home_link"
      assert airport.iata_code == "some iata_code"
      assert airport.id == 42
      assert airport.ident == "some ident"
      assert airport.iso_country == "some iso_country"
      assert airport.iso_region == "some iso_region"
      assert airport.keywords == "some keywords"
      assert airport.latitude_deg == "some latitude_deg"
      assert airport.local_code == "some local_code"
      assert airport.longitude_deg == "some longitude_deg"
      assert airport.municipality == "some municipality"
      assert airport.name == "some name"
      assert airport.scheduled_service == "some scheduled_service"
      assert airport.type == "some type"
      assert airport.wikipedia_link == "some wikipedia_link"
    end

    test "create_airport/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Airports.create_airport(@invalid_attrs)
    end

    test "update_airport/2 with valid data updates the airport" do
      airport = airport_fixture()
      assert {:ok, %Airport{} = airport} = Airports.update_airport(airport, @update_attrs)
      assert airport.continent == "some updated continent"
      assert airport.elevation_ft == "some updated elevation_ft"
      assert airport.gps_code == "some updated gps_code"
      assert airport.home_link == "some updated home_link"
      assert airport.iata_code == "some updated iata_code"
      assert airport.id == 43
      assert airport.ident == "some updated ident"
      assert airport.iso_country == "some updated iso_country"
      assert airport.iso_region == "some updated iso_region"
      assert airport.keywords == "some updated keywords"
      assert airport.latitude_deg == "some updated latitude_deg"
      assert airport.local_code == "some updated local_code"
      assert airport.longitude_deg == "some updated longitude_deg"
      assert airport.municipality == "some updated municipality"
      assert airport.name == "some updated name"
      assert airport.scheduled_service == "some updated scheduled_service"
      assert airport.type == "some updated type"
      assert airport.wikipedia_link == "some updated wikipedia_link"
    end

    test "update_airport/2 with invalid data returns error changeset" do
      airport = airport_fixture()
      assert {:error, %Ecto.Changeset{}} = Airports.update_airport(airport, @invalid_attrs)
      assert airport == Airports.get_airport!(airport.id)
    end

    test "delete_airport/1 deletes the airport" do
      airport = airport_fixture()
      assert {:ok, %Airport{}} = Airports.delete_airport(airport)
      assert_raise Ecto.NoResultsError, fn -> Airports.get_airport!(airport.id) end
    end

    test "change_airport/1 returns a airport changeset" do
      airport = airport_fixture()
      assert %Ecto.Changeset{} = Airports.change_airport(airport)
    end
  end

  describe "runways" do
    alias DagApi.Airports.Runway

    @valid_attrs %{
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

    def runway_fixture(attrs \\ %{}) do
      {:ok, runway} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Airports.create_runway()

      runway
    end

    test "list_runways/0 returns all runways" do
      runway = runway_fixture()
      assert Airports.list_runways() == [runway]
    end

    test "get_runway!/1 returns the runway with given id" do
      runway = runway_fixture()
      assert Airports.get_runway!(runway.id) == runway
    end

    test "create_runway/1 with valid data creates a runway" do
      assert {:ok, %Runway{} = runway} = Airports.create_runway(@valid_attrs)
      assert runway.airport_ident == "some airport_ident"
      assert runway.closed == true
      assert runway.he_displaced_threshold_ft == 42
      assert runway.he_elevation_ft == 42
      assert runway.he_heading_degT == 42
      assert runway.he_ident == "some he_ident"
      assert runway.he_latitude_deg == 42
      assert runway.he_longitude_deg == 42
      assert runway.id == 42
      assert runway.le_displaced_threshold_ft == 42
      assert runway.le_elevation_ft == 42
      assert runway.le_heading_degT == 42
      assert runway.le_ident == "some le_ident"
      assert runway.le_latitude_deg == "some le_latitude_deg"
      assert runway.le_longitude_deg == "some le_longitude_deg"
      assert runway.length_ft == 42
      assert runway.lighted == true
      assert runway.surface == "some surface"
      assert runway.width_ft == 42
    end

    test "create_runway/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Airports.create_runway(@invalid_attrs)
    end

    test "update_runway/2 with valid data updates the runway" do
      runway = runway_fixture()
      assert {:ok, %Runway{} = runway} = Airports.update_runway(runway, @update_attrs)
      assert runway.airport_ident == "some updated airport_ident"
      assert runway.closed == false
      assert runway.he_displaced_threshold_ft == 43
      assert runway.he_elevation_ft == 43
      assert runway.he_heading_degT == 43
      assert runway.he_ident == "some updated he_ident"
      assert runway.he_latitude_deg == 43
      assert runway.he_longitude_deg == 43
      assert runway.id == 43
      assert runway.le_displaced_threshold_ft == 43
      assert runway.le_elevation_ft == 43
      assert runway.le_heading_degT == 43
      assert runway.le_ident == "some updated le_ident"
      assert runway.le_latitude_deg == "some updated le_latitude_deg"
      assert runway.le_longitude_deg == "some updated le_longitude_deg"
      assert runway.length_ft == 43
      assert runway.lighted == false
      assert runway.surface == "some updated surface"
      assert runway.width_ft == 43
    end

    test "update_runway/2 with invalid data returns error changeset" do
      runway = runway_fixture()
      assert {:error, %Ecto.Changeset{}} = Airports.update_runway(runway, @invalid_attrs)
      assert runway == Airports.get_runway!(runway.id)
    end

    test "delete_runway/1 deletes the runway" do
      runway = runway_fixture()
      assert {:ok, %Runway{}} = Airports.delete_runway(runway)
      assert_raise Ecto.NoResultsError, fn -> Airports.get_runway!(runway.id) end
    end

    test "change_runway/1 returns a runway changeset" do
      runway = runway_fixture()
      assert %Ecto.Changeset{} = Airports.change_runway(runway)
    end
  end
end
