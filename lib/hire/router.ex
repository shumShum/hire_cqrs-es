defmodule Hire.Router do
  use Commanded.Commands.Router

  alias Hire.Users.Aggregates.User
  alias Hire.Users.Commands.RegisterUser
  alias Hire.Users.Commands.GetJob

  alias Hire.Jobs.Aggregates.Job
  alias Hire.Jobs.Commands.CreateJob
  alias Hire.Jobs.Commands.UpdateJob

  middleware(Commanded.Middleware.Logger)

  identify(User, by: :id, prefix: "user-")
  identify(Job, by: :id, prefix: "job-")

  dispatch([RegisterUser, GetJob], to: User)
  dispatch([CreateJob, UpdateJob], to: Job)
end
