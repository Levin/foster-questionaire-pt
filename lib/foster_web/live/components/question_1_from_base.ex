defmodule FosterWeb.Components.Question1 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
      socket
      |> assign(:people, false)
      |> assign(:media, false)
      |> assign(:internet, false)
      |> assign(:social_media, false)
      |> assign(:organizations, false)
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
        Onde ouviu falar de Acolhimento Familiar?
      </p>

      <.simple_form
        for={}
        phx-change="update_answers"
        phx-target={@myself}
        >
        <div class="flex items-center gap-2">
          <.input type="checkbox" name="social_media" checked={@social_media == "true"} />
          <div>
            <p class="font-nohemt">Redes sociais (Facebook, Instagram, outros)</p>
          </div>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="media" checked={@media == "true"} />
          <div>
            <p class="font-nohemt">TV, Rádio ou Jornal</p>
          </div>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="people" checked={@people == "true"} />
          <div>
            <p class="font-nohemt">Familiares, amigos, colegas</p>
          </div>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="organizations" checked={@organizations == "true"} />
          <p class="font-nohemt">Instituições governamentais ou sem fins lucrativos</p>
        </div>

        <div class="flex items-center gap-2">
          <.input type="checkbox" name="internet" checked={@internet == "true"} />
          <p class="font-nohemt">Internet</p>
        </div>

        <div class="flex items-center gap-2">
          <.label>Outros (especificar)</.label>
          <.input name="other" value="" placeholder="other"/>
        </div>
      </.simple_form>
    </div>
    """
  end
end
