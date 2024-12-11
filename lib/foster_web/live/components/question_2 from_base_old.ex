defmodule FosterWeb.Components.Question2FBold do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
     socket
     |> assign(:slide_number, 2)
    #  |> assign(:path, "")
     |> assign(:answers, %{})
    }
  end

  def handle_event("submit", params, socket) do
    updated_answers =
      socket.assigns.answers
      |> Map.put(:agespan, params["age"])
      |> Map.put(:gender, params["sex"])
      |> Map.put(:pt_region, params["region"])

    {:noreply,
     socket
     |> assign(:answers, updated_answers)
    #  |> assign(:path, params["question_3"])
     |> assign(:slide_number, 3)
    }
  end


  def render(assigns) do
    input_fields = [
      %{label: "Your Age", type: "select", name: "age", options: ["18-25", "26-35", "36-49", "50-65"]},
      %{label: "Your Gender", type: "select", name: "sex", options: ["Non-Binary", "I prefer not to say", "feminino", "masculino"]},
      %{label: "Region in Portugal", type: "select", name: "region", options: ["aveiro", "beja", "braga", "bragança", "castelo_branco", "coimbra", "evora", "faro", "guarda", "leiria", "lisboa", "porto", "santarem", "setubal", "viana_do_castelo", "vila_real", "viseu", "madeira", "acores"]}
    ]
    IO.inspect(assigns.slide_number, label: "Assigns in Question2 render")
    ~H"""
    <div>
      <.live_component module={FosterWeb.Sites.BasePage}
        id="q2"
        page_title="Breves dados demográficos"
        input_fields={input_fields}
        answers={@answers}
        slide_number={@slide_number} />
    </div>
    """
  end

  # def render(assigns) do
  #   ~H"""
  #   <div>
  #     <%= if @slide_2 do %>
  #       <div class="mx-10">
  #         <div class="mb-4">
  #           <img src="/images/somekids.svg" />
  #         </div>
  #         <p class="text-2xl text-light_dark_matter font-inter">
  #           Breves dados demográficos
  #         </p>

  #         <.simple_form for={} phx-change="validate" phx-submit="submit" phx-target={@myself}>
  #           <div class="flex items-center gap-2">
  #             <.label>Your Age</.label>
  #             <.input name="age" value="" placeholder="Age" type="select" options={["18-25", "26-35", "36-49", "50-65"]} />
  #           </div>
  #           <div class="flex items-center gap-2">
  #             <.label>Your Gender</.label>
  #             <.input name="sex" value="" placeholder="Sex" type="select" options={["Non-Binary", "I prefeer not to say","feminino", "maskulino"]} />
  #           </div>
  #           <div class="flex items-center gap-2">
  #             <.label>Region in Portugal</.label>
  #             <.input name="region" value="" placeholder="Region" type="select" options={["aveiro", "beja", "braga", "bragança", "castelo_branco", "coimbra", "evora", "faro", "guarda", "leiria", "lisboa", "porto", "santarem", "setubal", "viana_do_castelo", "vila_real", "viseu", "madeira", "acores"]}
  #       />
  #           </div>
  #           <.button>Submeter</.button>
  #         </.simple_form>
  #       </div>
  #     <% end %>
  #     <%= if @slide_3 do %>
  #       <.live_component
  #         module={FosterWeb.Components.Question3}
  #         id="question_3"
  #         branch={assigns.path}
  #         answers={@answers}
  #       />
  #     <% end %>
  #   </div>
  #   """
  # end
end
