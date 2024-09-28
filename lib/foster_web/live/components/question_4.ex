defmodule FosterWeb.Components.Question4 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok, 
      socket
      |> assign(:slide_4, true)
      |> assign(:slide_5, false)
    }
  end

  def update(params, socket) do
    IO.inspect(params)
    {:ok, 
      socket
    }
  end

  def handle_event("validate", params, socket) do
    {:noreply, 
      socket
    }
  end

  def handle_event("submit", _params, socket) do
    {:noreply,
      socket
      |> assign(:slide_4, false)
      |> assign(:slide_5, true)
    }
  end

  def render(assigns) do
    ~H"""
    <div class="mx-10">
      <%= if @slide_4 do %>
      <p class="text-2xl">
          Breves dados demograficos
      </p>

      <.simple_form 
      for={} 
      phx-change="validate" 
      phx-submit="submit"
      phx-target={@myself}
      >
      <div class="flex items-center gap-2">
      <p class="font-nohemt">Não tenho conhecimento.</p>
      </div>
      <div class="flex items-center gap-2">
      <div>
      <p class="font-nohemt">Não tenho, mas gostava de ter.</p>
      </div>
      </div>
      <div class="flex items-center gap-2">
      <p class="font-nohemt">Tenho.</p>
      </div>
      <.button>Submeter</.button>
      </.simple_form>


        <% end %>

      <%= if @slide_5 do %>
        <.live_component module={FosterWeb.Components.Question5} id="question_5" type={@type}/>
        <% end %>
    </div>
    """
  end
end
