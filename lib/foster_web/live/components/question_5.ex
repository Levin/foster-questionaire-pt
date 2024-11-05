defmodule FosterWeb.Components.Question5 do
  use FosterWeb, :live_component

  def mount(socket) do
    # answers = socket.assigns[:answers]
    # IO.inspect(answers, label: "Answers after final submit", struct: false, limit: :infinity)
    {:ok,
      socket
      |> assign(:slide_5, true)
      |> assign(:slide_6, false)
      |> assign(:money, false)
      |> assign(:housing, false)
      |> assign(:work, false)
      |> assign(:fear1, false)
      |> assign(:fear2, false)
      |> assign(:other, "")
    }
  end

  def update(params, socket) do
    {:ok,
      socket
      |> assign(:answers, params.answers)
    }
  end

  def handle_event("submit", params, socket) do

    # NOTE: do edit the params[....]
    filtered_answers =
      params
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

    IO.inspect(updated_answers, label: "Answers after Q5")
    {:noreply,
      socket
      # |> assign(:path, params["question_5"])
      # |> assign(:answers, updated_answers)
      # |> assign(:slide_5, false)
      |> push_navigate(to: "/donativos")
    }
  end

  def render(assigns) do
    ~H"""
    <div>
    <%= if @slide_5 do %>
    <div class="mx-10">
      <div class="mb-4">
        <img src="/images/somekids.svg" />
      </div>
      <p class="text-2xl text-light_dark_matter font-inter">
      Qoais são os principais desafios para que seja uma Família de Acolhimento?
      </p>

      <.simple_form
      for={}
      phx-submit="submit"
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
        <.input type="checkbox" name="Family Reasons" checked={@fear1 == "true"} />
        <div>
          <p class="font-nohemt">Contexto familiar actual desafiante</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Unexperienced Parents" checked={@fear2 == "true"} />
        <div>
          <p class="font-nohemt">Inexperiência parental</p>
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
    </div>
    """
  end
end
