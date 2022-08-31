defmodule LiveRedirectWeb.SecondLive do
  use LiveRedirectWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    second
    """
  end
end
