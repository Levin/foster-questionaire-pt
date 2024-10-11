defmodule FosterWeb.Components.Question61 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
     socket
     |> assign(:slide_6, true)
     |> assign(:slide_7, false)}
  end

  def update(%{path: path, answers: answers}, socket) do
    IO.inspect("answers in question 61")
    IO.inspect(answers)

    {:ok,
     socket
     |> assign(:path, path)}
  end

  def handle_event("validate", params, socket) do
    {:noreply, socket}
  end

  def handle_event("submit", _params, socket) do
    {:noreply,
     socket
     |> assign(:slide_6, false)
     |> assign(:slide_7, true)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= if @slide_6 do %>
        <p class="text-2xl">
          Breves dados demográficos
        </p>

        <.simple_form for={} phx-change="validate" phx-submit="submit" phx-target={@myself}>
          <div class="flex items-center gap-2">
            <input type="radio" name="motivos" value="0" />
            <p class="font-nohemt">Yes</p>
          </div>
          <div class="flex items-center gap-2">
            <input type="radio" name="motivos" value="1" />
            <p class="font-nohemt">No</p>
          </div>
          <.button>Submeter</.button>
        </.simple_form>
      <% end %>

      <%= if @slide_7 do %>
        <.live_component
          module={FosterWeb.Components.Question81}
          id="question_81"
          path={@path}
          answers={@answers}
        />
      <% end %>
    </div>
    """
  end
end
