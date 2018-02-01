defmodule Apolo.Brands do
  @moduledoc """
  The Brands context.
  """

  import Ecto.Query, warn: false
  alias Apolo.Repo

  alias Apolo.Brands.Client

  @doc """
  Returns the list of clients.

  ## Examples

      iex> list_clients()
      [%Client{}, ...]

  """
  def list_clients do
    Repo.all(Client)
  end

  @doc """
  Gets a single client.

  Raises `Ecto.NoResultsError` if the Client does not exist.

  ## Examples

      iex> get_client!(123)
      %Client{}

      iex> get_client!(456)
      ** (Ecto.NoResultsError)

  """
  def get_client!(id), do: Repo.get!(Client, id)

  @doc """
  Creates a client.

  ## Examples

      iex> create_client(%{field: value})
      {:ok, %Client{}}

      iex> create_client(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_client(attrs \\ %{}) do
    %Client{}
    |> Client.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a client.

  ## Examples

      iex> update_client(client, %{field: new_value})
      {:ok, %Client{}}

      iex> update_client(client, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_client(%Client{} = client, attrs) do
    client
    |> Client.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Client.

  ## Examples

      iex> delete_client(client)
      {:ok, %Client{}}

      iex> delete_client(client)
      {:error, %Ecto.Changeset{}}

  """
  def delete_client(%Client{} = client) do
    Repo.delete(client)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking client changes.

  ## Examples

      iex> change_client(client)
      %Ecto.Changeset{source: %Client{}}

  """
  def change_client(%Client{} = client) do
    Client.changeset(client, %{})
  end

  alias Apolo.Brands.BrandExpedient

  @doc """
  Returns the list of brand_expedients.

  ## Examples

      iex> list_brand_expedients()
      [%BrandExpedient{}, ...]

  """
  def list_brand_expedients do
    Repo.all(BrandExpedient)
  end

  @doc """
  Gets a single brand_expedient.

  Raises `Ecto.NoResultsError` if the Brand expedient does not exist.

  ## Examples

      iex> get_brand_expedient!(123)
      %BrandExpedient{}

      iex> get_brand_expedient!(456)
      ** (Ecto.NoResultsError)

  """
  def get_brand_expedient!(id), do: Repo.get!(BrandExpedient, id)

  @doc """
  Creates a brand_expedient.

  ## Examples

      iex> create_brand_expedient(%{field: value})
      {:ok, %BrandExpedient{}}

      iex> create_brand_expedient(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_brand_expedient(attrs \\ %{}) do
    %BrandExpedient{}
    |> BrandExpedient.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a brand_expedient.

  ## Examples

      iex> update_brand_expedient(brand_expedient, %{field: new_value})
      {:ok, %BrandExpedient{}}

      iex> update_brand_expedient(brand_expedient, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_brand_expedient(%BrandExpedient{} = brand_expedient, attrs) do
    brand_expedient
    |> BrandExpedient.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a BrandExpedient.

  ## Examples

      iex> delete_brand_expedient(brand_expedient)
      {:ok, %BrandExpedient{}}

      iex> delete_brand_expedient(brand_expedient)
      {:error, %Ecto.Changeset{}}

  """
  def delete_brand_expedient(%BrandExpedient{} = brand_expedient) do
    Repo.delete(brand_expedient)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking brand_expedient changes.

  ## Examples

      iex> change_brand_expedient(brand_expedient)
      %Ecto.Changeset{source: %BrandExpedient{}}

  """
  def change_brand_expedient(%BrandExpedient{} = brand_expedient) do
    BrandExpedient.changeset(brand_expedient, %{})
  end
end
