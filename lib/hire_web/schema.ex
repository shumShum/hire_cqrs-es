defmodule HireWeb.Schema do
  use Absinthe.Schema

  import_types(HireWeb.Schema.UserTypes)
  import_types(HireWeb.Schema.JobTypes)

  query do
    import_fields(:user_queries)
    import_fields(:job_queries)
  end

  mutation do
    import_fields(:user_mutations)
    import_fields(:job_mutations)
  end
end
