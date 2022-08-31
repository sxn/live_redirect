defmodule LiveRedirect.Repo do
  use Ecto.Repo,
    otp_app: :live_redirect,
    adapter: Ecto.Adapters.SQLite3
end
