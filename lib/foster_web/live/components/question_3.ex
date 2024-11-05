defmodule FosterWeb.Components.Question3 do
  use FosterWeb, :live_component
  require Logger

  def mount(socket) do
    {:ok,
      socket
      |> assign(:slide_3, true)
      |> assign(:slide_4, false)
      # |> assign(:one, false)
      # |> assign(:two, false)
      # |> assign(:three, false)
      # |> assign(:four, false)
      # |> assign(:five, false)
    }
  end

  def update(params, socket) do
    {:ok,
      socket
      |> assign(:answers, params.answers)
    }
  end

  def handle_event("submit", params, socket) do

    IO.inspect(params)
    IO.inspect(socket)

    updated_answers =
      Map.put(
        socket.assigns.answers,
        :becoming_foster,
        params["question_3"]
      )

      IO.inspect(updated_answers, label: "Answers after Q3")
    {:noreply,
      socket
      |> assign(:answers, updated_answers)
      |> assign(:path, params["question_3"])
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
      Qual é a probabilidade de vir a ser uma Família de Acolhimento?
      </p>

      <.simple_form
        for={}
        phx-submit="submit"
        phx-target={@myself}
        >

      <div class="flex items-center gap-2">
        <input type="radio" name="question_3" value="1" >
        <p class="font-nohemt">1 - Improvável</p>
      </div>

      <div class="flex items-center gap-2">
        <input type="radio" name="question_3" value="2" >
        <p class="font-nohemt">2 - Pouco provável</p>
      </div>

      <div class="flex items-center gap-2">
        <input type="radio" name="question_3" value="3" >
        <p class="font-nohemt">3 - Eventualmente</p>
      </div>

      <div class="flex items-center gap-2">
        <input type="radio" name="question_3" value="4" >
        <p class="font-nohemt">4 - Algo provável</p>
      </div>

      <div class="flex items-center gap-2">
        <input type="radio" name="question_3" value="5" >
        <p class="font-nohemt">5 - Muito provável</p>
      </div>

      <.button>Submeter</.button>
      </.simple_form>

      </div>
      <% end %>
      <%= if @slide_4 do %>
        <.live_component module={FosterWeb.Components.Question4} id="question_4" path={@path} answers={@answers} />
      <% end %>
    </div>
    """
  end
end
