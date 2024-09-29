defmodule FosterWeb.Components.Question8 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
     socket
     |> assign(:slide_8, true)
     |> assign(:slide_9, false)}
  end

  def update(params, socket) do
    IO.inspect(params)
    {:ok, socket}
  end

  def handle_event("validate", params, socket) do
    {:noreply, socket}
  end

  def handle_event("submit", _params, socket) do
    {:noreply,
     socket
     |> assign(:slide_8, false)
     |> assign(:slide_9, true)}
  end

  def render(assigns) do
    ~H"""
    <div class="mx-10">
      <%= if @slide_8 do %>
        <p class="text-2xl">
          Agradecimento & Call to Action (incl. informações institucionais)
        </p>

        <.simple_form for={} phx-change="validate" phx-submit="submit" phx-target={@myself}>
          <div class="flex items-center gap-2">
            <p class="font-nohemt">Não tenho conhecimento.</p>
          </div>
          <div class="flex items-center gap-2">
            <div>
              <p class="font-nohemt">Não tenho, mas gostava de ter.</p>
            </div>
          </div>
          <div class="flex items-center gap-2">
            <p class="font-nohemt">Tenho.</p>
          </div>
          <.button>Submeter</.button>
        </.simple_form>
      <% end %>

      <%= if @slide_9 do %>
        <.live_component module={FosterWeb.Components.End} id="end" type={@type} />
      <% end %>
    </div>
    """
  end
end
