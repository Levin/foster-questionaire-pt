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
      |> assign(:five, false)
    }
  end

  def update(params, socket) do
    IO.inspect(params)
    {:ok,
      socket
    }
  end

  def handle_event("submit", params, socket) do
    updated_answers = Map.put(%{}, :question_3, params["question_3"])

    {:noreply,
      socket
      |> assign(:path, params["question_3"])
      |> assign(:answers, updated_answers)
      |> assign(:slide_3, false)
      |> assign(:slide_4, true)
    }
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

      <.simple_form
        for={}
        phx-submit="submit"
        phx-target={@myself}
        >

      <div class="flex items-center gap-2">
        <input type="radio" name="question_3" value="1" >
        <p class="font-nohemt">1</p>
      </div>

      <div class="flex items-center gap-2">
        <input type="radio" name="question_3" value="2" >
        <p class="font-nohemt">2</p>
      </div>

      <div class="flex items-center gap-2">
        <input type="radio" name="question_3" value="3" >
        <p class="font-nohemt">3</p>
      </div>

      <div class="flex items-center gap-2">
        <input type="radio" name="question_3" value="4" >
        <p class="font-nohemt">4</p>
      </div>

      <div class="flex items-center gap-2">
        <input type="radio" name="question_3" value="5" >
        <p class="font-nohemt">5</p>
      </div>

      <.button>Submeter</.button>
      </.simple_form>

      </div>
      <% end %>
      <%= if @slide_4 do %>
        <.live_component module={FosterWeb.Components.Question4} id="question_4" branch={@path} answers={@answers} />
      <% end %>
    </div>
    """
  end
end
