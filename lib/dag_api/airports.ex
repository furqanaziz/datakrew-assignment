defmodule DagApi.Airports do
  @moduledoc """
  The Airports context.
  """

  import Ecto.Query, warn: false
  alias DagApi.Repo

  alias DagApi.Airports.Airport

  @doc """
  Returns the list of airports.

  ## Examples

      iex> list_airports()
      [%Airport{}, ...]

  """
  def list_airports do
    Repo.all(Airport)
  end

  @doc """
  Gets a single airport.

  Raises `Ecto.NoResultsError` if the Airport does not exist.

  ## Examples

      iex> get_airport!(123)
      %Airport{}

      iex> get_airport!(456)
      ** (Ecto.NoResultsError)

  """
  def get_airport!(id), do: Repo.get!(Airport, id)
  def get_airport(id), do: Repo.get(Airport, id)

  @doc """
  Creates a airport.

  ## Examples

      iex> create_airport(%{field: value})
      {:ok, %Airport{}}

      iex> create_airport(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_airport(attrs \\ %{}) do
    %Airport{}
    |> Airport.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a airport.

  ## Examples

      iex> update_airport(airport, %{field: new_value})
      {:ok, %Airport{}}

      iex> update_airport(airport, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_airport(%Airport{} = airport, attrs) do
    airport
    |> Airport.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a airport.

  ## Examples

      iex> delete_airport(airport)
      {:ok, %Airport{}}

      iex> delete_airport(airport)
      {:error, %Ecto.Changeset{}}

  """
  def delete_airport(%Airport{} = airport) do
    Repo.delete(airport)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking airport changes.

  ## Examples

      iex> change_airport(airport)
      %Ecto.Changeset{data: %Airport{}}

  """
  def change_airport(%Airport{} = airport, attrs \\ %{}) do
    Airport.changeset(airport, attrs)
  end

  alias DagApi.Airports.Runway

  @doc """
  Returns the list of runways.

  ## Examples

      iex> list_runways()
      [%Runway{}, ...]

  """
  def list_runways do
    Repo.all(Runway)
  end

  def list_runways(airport_id) do
    from(r in Runway, where: r.airport_ref == ^airport_id)
    |> Repo.all
  end

  @doc """
  Gets a single runway.

  Raises `Ecto.NoResultsError` if the Runway does not exist.

  ## Examples

      iex> get_runway!(123)
      %Runway{}

      iex> get_runway!(456)
      ** (Ecto.NoResultsError)

  """
  def get_runway!(id), do: Repo.get!(Runway, id)

  @doc """
  Creates a runway.

  ## Examples

      iex> create_runway(%{field: value})
      {:ok, %Runway{}}

      iex> create_runway(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_runway(attrs \\ %{}) do
    %Runway{}
    |> Runway.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a runway.

  ## Examples

      iex> update_runway(runway, %{field: new_value})
      {:ok, %Runway{}}

      iex> update_runway(runway, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_runway(%Runway{} = runway, attrs) do
    runway
    |> Runway.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a runway.

  ## Examples

      iex> delete_runway(runway)
      {:ok, %Runway{}}

      iex> delete_runway(runway)
      {:error, %Ecto.Changeset{}}

  """
  def delete_runway(%Runway{} = runway) do
    Repo.delete(runway)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking runway changes.

  ## Examples

      iex> change_runway(runway)
      %Ecto.Changeset{data: %Runway{}}

  """
  def change_runway(%Runway{} = runway, attrs \\ %{}) do
    Runway.changeset(runway, attrs)
  end
end
