defmodule FosterWeb.Components.Question4old do
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
    {:ok,
      socket
      |> assign(:answers, params.answers)
    }
  end


  def handle_event("submit", params, socket) do
    filtered_answers =
      params
      |> Enum.filter(fn {_, value} -> value == "true" end)
      |> Enum.map(fn {key, _} -> key end)

    IO.inspect(filtered_answers)

    updated_answers = Map.put(
      socket.assigns.answers,
      :motive_for_fostering,
      filtered_answers
    )

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
      Quais são os principais motivos da sua resposta anterior?
      </p>

      <.simple_form
      for={}
      phx-submit="submit"
      phx-target={@myself}
      >
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Cannot have kids" checked={@altruism == "true"} />
        <div>
          <p class="font-nohemt">Não poder ter filhos</p>
        </div>
      </div>
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Altruism" checked={@money == "true"} />
        <div>
          <p class="font-nohemt">Assegurar ambiente familiar a uma criança vulnerável</p>
        </div>
      </div>
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Financial Benefits" checked={@money == "true"} />
        <div>
          <p class="font-nohemt">Apoio e benefícios financeiros</p>
        </div>
      </div>
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="No Interest" checked={@money == "true"} />
        <div>
          <p class="font-nohemt">Não tenho interesse</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.label>Outro</.label>
        <.input name="other" value="" placeholder="other"/>
      </div>

      <.button>Submeter</.button>
      </.simple_form>

    </div>
    <% end %>
      <%= if @slide_5 do %>
        <.live_component module={FosterWeb.Components.Question5} id="question_5" path={@path} answers={@answers} />
      <% end %>
    </div>
    """
  end

end
