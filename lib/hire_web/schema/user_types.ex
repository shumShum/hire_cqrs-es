defmodule HireWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  alias HireWeb.UserResolver

  object :user do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :type, non_null(:string)
    field :job, :job
  end

  object :user_queries do
    field :get_user, non_null(:user) do
      resolve(&UserResolver.current/3)
    end
  end

  object :user_mutations do
  end
end
