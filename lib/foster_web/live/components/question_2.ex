defmodule FosterWeb.Components.Question2 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok, 
      socket
      |> assign(:slide_2, true)
      |> assign(:slide_3, false)
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
      |> assign(:slide_2, false)
      |> assign(:slide_3, true)
    }
  end

  def render(assigns) do
    ~H"""
    <div class="mx-10">
      <p class="text-2xl">
        Onde ouviu falar de Acolhimento Familiar?
      </p>

      <.simple_form 
      for={} 
      phx-change="validate" 
      phx-submit="submit"
      phx-target={@myself}
      >
      <div class="flex items-center gap-2">
      <p class="font-nohemt">Yes</p>
      </div>
      <div class="flex items-center gap-2">
      <div>
      <p class="font-nohemt">No</p>
      </div>
      </div>
      <.button>Submeter</.button>
      </.simple_form>



      <%= if @slide_3 do %>

      <% end %>
    </div>
    """
  end
end
