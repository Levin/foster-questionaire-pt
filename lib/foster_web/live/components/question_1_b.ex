defmodule FosterWeb.Components.Question1b do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
      socket
      |> assign(:slide_1, true)
      |> assign(:slide_2, false)
      |> assign(:media, false)
      |> assign(:social_media, false)
      |> assign(:people, false)
      |> assign(:gov, false)
      |> assign(:ngo, false)
      |> assign(:other, "")
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
    {:noreply,
      socket
      |> assign(:media, params["media"])
      |> assign(:social_media, params["social_media"])
      |> assign(:people, params["people"])
      |> assign(:gov, params["gov"])
      |> assign(:ngo, params["ngo"])
      |> assign(:other, params["other"])
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
        Map.put(socket.assigns.answers, :heard_where, filtered_answers ++ [[other: other_answer]])
      else
        Map.put(socket.assigns.answers, :heard_where, filtered_answers)
      end

    IO.inspect(updated_answers, label: "Answers after Q1b")
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
        <.input type="checkbox" name="media" checked={@media == "true"} />
          <p class="font-nohemt">TV, Rádio ou Jornal</p>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="social_media" checked={@social_media == "true"} />
        <p class="font-nohemt">Redes sociais (Facebook, Instagram, outros)</p>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="people" checked={@people == "true"} />
        <p class="font-nohemt">Familiares, amigos, colegas</p>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="gov" checked={@gov == "true"} />
        <p class="font-nohemt">Instituições governamentais</p>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="ngo" checked={@ngo == "true"} />
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
