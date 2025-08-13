defmodule FosterWeb.Components.Question2 do
  use FosterWeb, :live_component

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
      |> Map.put(:gender, params["sex"])
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
          <.label>Your Age</.label>
          <.input name="age" value="" placeholder="Age" type="select"
                  options={["--", "18-25", "26-35", "36-49", "50-65"]} />
        </div>

        <div class="flex items-center gap-2">
          <.label>Your Gender</.label>
          <.input name="sex" value="" placeholder="Sex" type="select"
                  options={["--", "Non-Binary", "I prefeer not to say","feminino", "maskulino"]} />
        </div>

        <div class="flex items-center gap-2">
          <.label>Region in Portugal</.label>
          <.input name="region"
                  value=""
                  placeholder="Region"
                  type="select"
                  options={["--", "aveiro", "beja", "braga", "bragança", "castelo_branco", "coimbra", "evora", "faro",
                            "guarda", "leiria", "lisboa", "porto", "santarem", "setubal", "viana_do_castelo",
                            "vila_real", "viseu", "madeira", "acores"]} />
        </div>
      </.simple_form>
    </div>
    """
  end
end
