defmodule DagApiWeb.RunwayController do
  use DagApiWeb, :controller

  alias DagApi.Airports
  alias DagApi.Airports.Runway

  action_fallback DagApiWeb.FallbackController

  @spec index(Plug.Conn.t(), any) :: Plug.Conn.t()
  def index(conn, %{"airport_id" => airport_id}) do
    runways = Airports.list_runways(airport_id)
    # runways = Airports.list_runways()
    render(conn, "index.json", runways: runways)
  end

  # def create(conn, %{"runway" => runway_params}) do
  #   with {:ok, %Runway{} = runway} <- Airports.create_runway(runway_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.runway_path(conn, :show, runway))
  #     |> render("show.json", runway: runway)
  #   end
  # end

  def show(conn, %{"id" => id}) do
    runway = Airports.get_runway!(id)
    render(conn, "show.json", runway: runway)
  end

  def update(conn, %{"id" => id, "runway" => runway_params}) do
    runway = Airports.get_runway!(id)

    with {:ok, %Runway{} = runway} <- Airports.update_runway(runway, runway_params) do
      render(conn, "show.json", runway: runway)
    end
  end

  # def delete(conn, %{"id" => id}) do
  #   runway = Airports.get_runway!(id)

  #   with {:ok, %Runway{}} <- Airports.delete_runway(runway) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
