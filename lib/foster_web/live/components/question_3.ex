defmodule FosterWeb.Components.Question3 do
  use FosterWeb, :live_component
  require Logger

  def mount(socket) do
    {:ok,
     socket
     |> assign(:slide_3, true)
     |> assign(:slide_4, false)
     |> assign(:one, false)
     |> assign(:two, false)
     |> assign(:three, false)
     |> assign(:four, false)
     |> assign(:five, false)}
  end

  def update(params, socket) do
    IO.inspect(params)

    {:ok,
     socket
     |> assign(:type, "")}
  end

  def handle_event("validate", params, socket) do
    {:noreply,
     socket
     |> assign(:one, params["one"])
     |> assign(:two, params["two"])
     |> assign(:three, params["three"])
     |> assign(:four, params["four"])
     |> assign(:five, params["five"])}
  end

  def handle_event("submit", _params, socket) do
    {:noreply,
     socket
     |> assign(:slide_3, false)
     |> assign(:slide_4, true)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= if @slide_3 do %>
        <div class="mx-10">
          <div class="mb-4">
            <img src="/images/somekids.svg" />
          </div>
          <p class="text-2xl text-light_dark_matter font-inter">
            De 1 (menos provável) a 5 (mais provável), Consideraria ser uma Família de Acolhimento?
          </p>

          <.simple_form for={} phx-change="validate" phx-submit="submit" phx-target={@myself}>
            <div class="flex items-center gap-2">
              <.input type="checkbox" name="one" checked={@one == "true"} />
              <div>
                <p class="font-nohemt">1</p>
              </div>
            </div>
            <div class="flex items-center gap-2">
              <.input type="checkbox" name="two" checked={@two == "true"} />
              <div>
                <p class="font-nohemt">2</p>
              </div>
            </div>

            <div class="flex items-center gap-2">
              <.input type="checkbox" name="three" checked={@three == "true"} />
              <div>
                <p class="font-nohemt">3</p>
              </div>
            </div>

            <div class="flex items-center gap-2">
              <.input type="checkbox" name="four" checked={@four == "true"} />
              <p class="font-nohemt">4</p>
            </div>

            <div class="flex items-center gap-2">
              <.input type="checkbox" name="five" checked={@five == "true"} />
              <p class="font-nohemt">5</p>
            </div>

            <.button>Submeter</.button>
          </.simple_form>
        </div>
      <% end %>
      <%= if @slide_4 do %>
        <.live_component
          module={FosterWeb.Components.Question4}
          id="question_4"
          branch={assigns.type}
        />
      <% end %>
    </div>
    """
  end
end
