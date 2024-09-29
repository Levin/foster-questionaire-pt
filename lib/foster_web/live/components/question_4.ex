defmodule FosterWeb.Components.Question4 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
      socket
      |> assign(:slide_4, true)
      |> assign(:slide_5, false)
      |> assign(:altruism, false)
      |> assign(:money, false)
      |> assign(:love, false)
    }
  end

  def update(params, socket) do
    IO.inspect(params)
    {:ok, socket}
  end


  def handle_event("submit", params, socket) do
    updated_answers = Map.put(%{}, :question_4, params["question_4"])
    {:noreply,
      socket
      |> assign(:path, params["question_4"])
      |> assign(:answers, updated_answers)
      |> assign(:slide_4, false)
      |> assign(:slide_5, true)
    }
  end

  def render(assigns) do
    ~H"""
    <div>
    <%= if @slide_4 do %>
    <div class="mx-10">
      <div class="mb-4">
        <img src="/images/somekids.svg" />
      </div>
      <p class="text-2xl text-light_dark_matter font-inter">
        Quais os principais motivos para considerar ser uma Família de Acolhimento?
      </p>

      <.simple_form
      for={}
      phx-submit="submit"
      phx-target={@myself}
      >
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="altruism" checked={@altruism == "true"} />
        <div>
          <p class="font-nohemt">Altruism</p>
        </div>
      </div>
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="money" checked={@money == "true"} />
        <div>
          <p class="font-nohemt">Money support</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="love" checked={@love == "true"} />
        <div>
          <p class="font-nohemt">Talent + love for children</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.label>Other</.label>
        <.input name="other" value="" placeholder="other"/>
      </div>

      <.button>Submeter</.button>
      </.simple_form>

    </div>
    <% end %>
      <%= if @slide_5 do %>
        <.live_component module={FosterWeb.Components.Question5} id="question_5" branch={@path} answers={@answers} />
      <% end %>
    </div>
    """
  end

end
