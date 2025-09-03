defmodule FosterWeb.Components.Question5 do
  use FosterWeb, :live_component

  def mount(socket) do
    # answers = socket.assigns[:answers]
    # IO.inspect(answers, label: "Answers after final submit", struct: false, limit: :infinity)
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

    other_answer = params["other"]

    updated_answers =
      if other_answer != "" do
        Map.put(
          socket.assigns.answers,
          :challenges,
          filtered_answers ++ [[other: other_answer]]
        )
      else
        Map.put(
          socket.assigns.answers,
          :challenges,
          filtered_answers
        )
      end

    # update database here
    Foster.Answers.create_answer(%{body: updated_answers})

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
        <.input type="checkbox" name="Financeira" checked={@money == "true"} />
        <div>
          <p class="font-nohemt">Encargo financeiro adicional</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Habitação" checked={@housing == "true"} />
        <div>
          <p class="font-nohemt"> Condições habitacionais actuais</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Carga de trabalho" checked={@work == "true"} />
        <div>
          <p class="font-nohemt">Limitações por motivos profissionais</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Familiares" checked={@family_context == "true"} />
        <div>
          <p class="font-nohemt">Contexto familiar actual desafiante</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Inexperiência" checked={@lack_experience == "true"} />
        <div>
          <p class="font-nohemt">Inexperiência parental</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.label>Outro</.label>
        <.input name="Outro" value="" placeholder="outro"/>
      </div>

      </.simple_form>
    </div>
    """
  end
end
