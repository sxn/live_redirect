defmodule LiveRedirectWeb.FirstLive do
  use LiveRedirectWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <.form let={f} for={:form} phx-change="validate" phx-submit="save">
      <%= text_input(f, :presentation, phx_debounce: "blur") %>
      <%= submit( "Save") %>
    </.form>
    """
  end

  @impl true
  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("save", _params, socket) do
    {:noreply, socket |> push_redirect(to: Routes.second_path(socket, :index))}
  end
end
