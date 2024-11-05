defmodule FosterWeb.Components.Question4 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
      socket
      |> assign(:slide_4, true)
      |> assign(:slide_5, false)
      |> assign(:baren, false)
      |> assign(:altruism, false)
      |> assign(:money, false)
      |> assign(:nomoney, false)
      |> assign(:nointerest, false)
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
    filtered_answers =
      params
      |> Enum.filter(fn {_, value} -> value == "true" end)
      |> Enum.map(fn {key, _} -> key end)


    other_answer = params["other"]

    updated_answers =
      if other_answer != "" do
        Map.put(
          socket.assigns.answers,
          :justification,
          filtered_answers ++ [[other: other_answer]]
        )
      else
        Map.put(
          socket.assigns.answers,
          :justification,
          filtered_answers
        )
      end

    IO.inspect(updated_answers, label: "Answers after Q4")
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
        <.input type="checkbox" name="Cannot have kids" checked={@baren == "true"} />
        <p class="font-nohemt">Incapacidade de ter filhos</p>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Altruism" checked={@altruism == "true"} />
        <p class="font-nohemt">Assegurar ambiente familiar a uma criança vulnerável</p>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Financial benefits" checked={@money == "true"} />
        <p class="font-nohemt">Apoio e benefícios financeiros</p>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Insufficient financial benefits" checked={@nomoney == "true"} />
        <p class="font-nohemt">Insuficiente apoio e benefícios financeiro</p>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="No Interest" checked={@nointerest == "true"} />
        <p class="font-nohemt">Falta de interesse</p>
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
