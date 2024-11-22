defmodule FosterWeb.Sites.BasePage do
  use FosterWeb, :live_view

  def form_item(%{label: label, type: type, name: name, options: options}) do
    ~H"""
    <div class="flex items-center gap-2">
      <.label><%= label %></.label>
      <.input type="<%= type %>" name="<%= name %>" />
    </div>
    """
  end

  def render(assigns, page_title, input_fields) do
     ~H"""
    <div>
      <p class="text-2xl text-light_dark_matter font-inter">
        <%= @page_title %>
      </p>

      <.simple_form for={} phx-submit="submit" phx-target={@myself}>
        <%= for field <- @input_fields do %>
          <%= form_item(field) %>
        <% end %>
        <.button>Submeter</.button>
      </.simple_form>
    </div>
    """
  end
end
