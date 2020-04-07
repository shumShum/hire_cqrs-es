defmodule Hire.RepoRead do
  use Ecto.Repo,
    otp_app: :hire,
    adapter: Ecto.Adapters.Postgres

  def fetch(query) do
    case one(query) do
      nil -> {:error, {:not_found, query: query}}
      entry -> {:ok, entry}
    end
  end

  def fetch(scheme, id) do
    case get(scheme, id) do
      nil -> {:error, {:not_found, scheme: scheme, id: id}}
      entry -> {:ok, entry}
    end
  end

  def fetch_by(scheme, opts) do
    case get_by(scheme, opts) do
      nil -> {:error, {:not_found, [{:scheme, scheme} | opts]}}
      entry -> {:ok, entry}
    end
  end
end
