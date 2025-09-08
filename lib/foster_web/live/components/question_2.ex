defmodule FosterWeb.Components.Question2 do
  use FosterWeb, :live_component

  @impl true
  def mount(socket) do
    {:ok,
     socket
     |> assign(:answers, %{})
    }
  end


  @impl true
  def handle_event("update_answers", params, socket) do
    # Extract the relevant answers from params

    updated_answers =
      socket.assigns.answers
      |> Map.put(:agespan, params["age"])
      |> Map.put(:gender, params["gender"])
      |> Map.put(:pt_region, params["region"])

    send(self(), {:update_answers, updated_answers})

    {:noreply, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <p class="text-2xl text-light_dark_matter font-inter">
        Breves dados demográficos
      </p>

      <.simple_form
        for={}
        phx-change="update_answers"
        phx-target={@myself}>
        <div class="flex items-center gap-2">
          <.label>Idade</.label>
          <.input name="age" value="" placeholder="Idade" type="select"
                  options={["--", "18-25", "26-35", "36-49", "50-65", ">65"]} />
        </div>

        <div class="flex items-center gap-2">
          <.label>Gênero</.label>
          <.input name="gender" value="" placeholder="Gênero" type="select"
                  options={["--", "Não-binário", "Prefiro não dizer","Feminino", "Masculino"]} />
        </div>

        <div class="flex items-center gap-2">
          <.label>Região</.label>
          <.input name="region"
                  value=""
                  placeholder="Região"
                  type="select"
                  options={["--", "Aveiro", "Beja", "Braga", "Bragança", "Castelo Branco", "Coimbra", "Évora", "Faro",
                            "Guarda", "Leiria", "Lisboa", "Porto", "Santarém", "Setúbal", "Viana do Castelo",
                            "Vila Real", "Viseu", "Madeira", "Açores"]} />
        </div>
      </.simple_form>
    </div>
    """
  end
end
