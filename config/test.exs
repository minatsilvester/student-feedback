use Mix.Config

# Configure your database
config :react_workshop_feedback, ReactWorkshopFeedback.Repo,
  username: "postgres",
  password: "postgres",
  database: "react_workshop_feedback_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :react_workshop_feedback, ReactWorkshopFeedbackWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
