defmodule FosterWeb.Components.Question4 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
      socket
      |> assign(:no_kids, false)
      |> assign(:altruism, false)
      |> assign(:fin_benefits, false)
      |> assign(:no_interest, false)
      |> assign(:other, "")
      |> assign(:answers, %{})
    }
  end

  @impl true
  def handle_event("update_answers", params, socket) do
    # Extract the relevant answers from params
    filtered_answers = params
      |> Enum.filter(fn {_, value} -> value == "true" end)
      |> Enum.map(fn {key, _} -> key end)

    updated_answers = Map.put(
      socket.assigns.answers,
      :heard_about_fostering,
      filtered_answers
    )

    send(self(), {:update_answers, updated_answers})

    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <p class="text-2xl text-light_dark_matter font-inter">
        Quais são os principais motivos da sua resposta anterior?
      </p>

      <.simple_form
        for={}
        phx-change="update_answers"
        phx-target={@myself}
        >
        <div class="flex items-center gap-2">
          <.input type="checkbox" name="Cannot have kids" checked={@no_kids == "true"} />
          <div>
            <p class="font-nohemt">Não poder ter filhos</p>
          </div>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="Altruism" checked={@altruism == "true"} />
          <div>
            <p class="font-nohemt">Assegurar ambiente familiar a uma criança vulnerável</p>
          </div>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="Financial Benefits" checked={@fin_benefits == "true"} />
          <div>
            <p class="font-nohemt">Apoio e benefícios financeiros</p>
          </div>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="No Interest" checked={@no_interest == "true"} />
          <div>
            <p class="font-nohemt">Não tenho interesse</p>
          </div>
        </div>

        <div class="flex items-center gap-2">
          <.label>Outro</.label>
          <.input name="other" value="" placeholder="other"/>
        </div>

      </.simple_form>
    </div>
    """
  end

end
