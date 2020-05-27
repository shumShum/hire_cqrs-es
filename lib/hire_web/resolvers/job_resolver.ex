defmodule HireWeb.JobResolver do
  alias Hire.Jobs

  def all(_, _, %{context: ctx}) do
    jobs = Jobs.all_for(ctx.user) |> IO.inspect()
    {:ok, jobs}
  end

  def create(_, args, %{context: ctx}) do
    IO.inspect(ctx.user, label: :USER)
    {:ok, %{id: 666, title: args.title}}
  end

  def update(_, _args, %{context: _ctx}) do
  end

  def get(_, _args, %{context: _ctx}) do
  end
end
