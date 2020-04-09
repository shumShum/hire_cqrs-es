defmodule Hire.Dispatcher do
  use Commanded.Application, otp_app: :hire

  router(Hire.Router)
end
