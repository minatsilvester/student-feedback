defmodule ReactWorkshopFeedback.Repo do
  use Ecto.Repo,
    otp_app: :react_workshop_feedback,
    adapter: Ecto.Adapters.Postgres
end
