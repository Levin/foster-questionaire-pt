defmodule FosterWeb.Components.Question81 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok, 
      socket
      |> assign(:slide_61, true)
      |> assign(:slide_81, false)
    }
  end

  def update(params, socket) do
    IO.inspect(params)
    {:ok, 
      socket
      |> assign(:path, params["path"])
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
      |> assign(:slide_61, false)
      |> assign(:slide_81, true)
    }
  end

  def render(assigns) do
    ~H"""
    <div >
      <%= if @slide_61 do %>
      <p class="text-2xl">
       Agradecimento & Call to Action (incl. informações institucionais)
      </p>

      <.simple_form 
      for={} 
      phx-change="validate" 
      phx-submit="submit"
      phx-target={@myself}
      >
        <div class="flex items-center gap-2">
        <input type="radio" name="motivos" value="0" />
        <p class="font-nohemt">Yes</p>
        </div>
        <div class="flex items-center gap-2">
        <input type="radio" name="motivos" value="1" />
        <p class="font-nohemt">No</p>
        </div>
 
      <.button>Submeter</.button>
      </.simple_form>

        <% end %>

      <%= if @slide_81 do %>
        <.live_component module={FosterWeb.Components.End} id="end" type={@path}/>
        <% end %>
    </div>
    """
  end
end

