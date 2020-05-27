defmodule HireWeb.Schema.JobTypes do
  use Absinthe.Schema.Notation

  alias HireWeb.JobResolver

  object :company do
    field :name, :string
  end

  object :job do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :salary, non_null(:integer)
    field :limit, non_null(:integer)
    field :company, :company
    field :workers, list_of(:user)
  end

  object :job_queries do
    field :all_jobs, non_null(list_of(non_null(:job))) do
      resolve(&JobResolver.all/3)
    end
  end

  object :job_mutations do
    field :create_job, :job do
      arg(:title, non_null(:string))
      arg(:salary, non_null(:integer))
      arg(:limit, non_null(:integer))

      resolve(&JobResolver.create/3)
    end

    field :update_job, :job do
      arg(:id, non_null(:id))
      arg(:title, non_null(:string))
      arg(:salary, non_null(:integer))
      arg(:limit, non_null(:integer))

      resolve(&JobResolver.update/3)
    end
  end
end
