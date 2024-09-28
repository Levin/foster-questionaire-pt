import Config

config :foster, Foster.Repo,
  username: "levin",
  password: "postgres",
  hostname: "localhost",
  database: "foster_dev",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
