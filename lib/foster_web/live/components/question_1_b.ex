defmodule FosterWeb.Components.Question1b do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
      socket
      |> assign(:slide_1, true)
      |> assign(:slide_2, false)
      |> assign(:people, false)
      |> assign(:media, false)
      |> assign(:internet, false)
      |> assign(:social_media, false)
      |> assign(:organizations, false)
    }
  end

  def update(params, socket) do
    {:ok,
      socket
      |> assign(:path, params.path)
      |> assign(:answers, params.answers)
    }
  end

  def handle_event("validate", params, socket) do
    IO.inspect(params)
    {:noreply,
      socket
      |> assign(:people, params["people"])
      |> assign(:media, params["media"])
      |> assign(:internet, params["internet"])
      |> assign(:social_media, params["social_media"])
      |> assign(:organizations, params["organizations"])
    }
  end

  def handle_event("submit", params, socket) do

    filtered_answers = 
      params
      |> Enum.filter(fn {_, value} -> value == "true" end)
      |> Enum.map(fn {key, _} -> key end)

    updated_answers = Map.put(
      socket.assigns.answers,
      :heard_about_fostering,
      filtered_answers
    )

    {:noreply,
      socket
      |> assign(:type, "")
      |> assign(:slide_1, false)
      |> assign(:slide_2, true)
      |> assign(:answers, updated_answers)
    }
  end

  def render(assigns) do
    ~H"""
    <div>
    <%= if @slide_1 do %>
    <div class="mx-10">
      <div class="mb-4">
        <img src="/images/somekids.svg" />
      </div>
      <p class="text-2xl text-light_dark_matter font-inter">
        Onde ouviu falar de Acolhimento Familiar?
      </p>

      <.simple_form
      for={}
      phx-change="validate"
      phx-submit="submit"
      phx-target={@myself}
      >
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="people" checked={@people == "true"} />
        <div>
          <p class="font-nohemt">Redes sociais (Facebook, Instagram, outros)</p>
        </div>
      </div>
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="internet" checked={@internet == "true"} />
        <div>
          <p class="font-nohemt">TV, Rádio ou Jornal</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="media" checked={@media == "true"} />
        <div>
          <p class="font-nohemt">Familiares, amigos, colegas</p>
        </div>
      </div>
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="social_media" checked={@social_media == "true"} />
        <p class="font-nohemt">Instituições governamentais</p>
      </div>
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="social_media" checked={@organizations == "true"} />
        <p class="font-nohemt">Organizações sem fins lucrativos</p>
      </div>
      <div class="flex items-center gap-2">
        <.label>Outros (especificar)</.label>
        <.input name="other" value="" placeholder="other"/>
      </div>

      <.button>Submeter</.button>
      </.simple_form>

    </div>
    <% end %>
      <%= if @slide_2 do %>
        <.live_component module={FosterWeb.Components.Question2} id="question_2" path={@path} answers={@answers} />
      <% end %>
    </div>
    """
  end
end
