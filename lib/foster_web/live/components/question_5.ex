defmodule FosterWeb.Components.Question5 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
      socket
      |> assign(:slide_5, true)
      |> assign(:slide_6, false)
      |> assign(:money, false)
      |> assign(:conditions, false)
      |> assign(:fear1, false)
      |> assign(:fear2, false)
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
    updated_answers = Map.put(
      socket.assigns.answers,
      :motive_against_fostering,
      [params["money"], params["conditions"], params["fear1"], params["fear2"]]
    )

    {:noreply,
      socket
      |> assign(:path, params["question_5"])
      |> assign(:answers, updated_answers)
      |> assign(:slide_5, false)
      |> assign(:slide_6, true)
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
        Quais os principais desafios para aculher uma crianca?
      </p>

      <.simple_form
      for={}
      phx-submit="submit"
      phx-target={@myself}
      >
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="Financial" checked={@money == "true"} />
        <div>
          <p class="font-nohemt">Financial</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="conditions" checked={@conditions == "true"} />
        <div>
          <p class="font-nohemt">Home conditions</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="fear1" checked={@fear1 == "true"} />
        <div>
          <p class="font-nohemt">Fear of attachment + loss</p>
        </div>
      </div>

      <div class="flex items-center gap-2">
        <.input type="checkbox" name="fear2" checked={@fear2 == "true"} />
        <div>
          <p class="font-nohemt">Fear a "difficult" child</p>
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
      <%= if @slide_6 do %>
        <.live_component module={FosterWeb.Components.Endpage} id="endpage" branch={@path} answers={@answers}/>
      <% end %>
    </div>
    """
  end

end
