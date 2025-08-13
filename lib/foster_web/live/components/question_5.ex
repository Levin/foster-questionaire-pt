defmodule FosterWeb.Components.Question5 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
      socket
      |> assign(:money, false)
      |> assign(:housing, false)
      |> assign(:work, false)
      |> assign(:family_context, false)
      |> assign(:lack_experience, false)
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
      :motive_against_fostering,
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
        Qoais são os principais desafios para que seja uma Família de Acolhimento?
      </p>

      <.simple_form
        for={}
        phx-change="update_answers"
        phx-target={@myself}
        >
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Financial" checked={@money == "true"} />
        <div>
          <p class="font-nohemt">Encargo financeiro adicional</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Housing Conditions" checked={@housing == "true"} />
        <div>
          <p class="font-nohemt"> Condições habitacionais actuais</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Workload" checked={@work == "true"} />
        <div>
          <p class="font-nohemt">Limitações por motivos profissionais</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Family Reasons" checked={@family_context == "true"} />
        <div>
          <p class="font-nohemt">Contexto familiar actual desafiante</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Unexperienced Parents" checked={@lack_experience == "true"} />
        <div>
          <p class="font-nohemt">Inexperiência parental</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.label>Other</.label>
        <.input name="other" value="" placeholder="other"/>
      </div>

      </.simple_form>
    </div>
    """
  end

end
