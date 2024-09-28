defmodule FosterWeb.Components.Question51 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok, 
      socket
      |> assign(:slide_5, true)
      |> assign(:slide_6, false)
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
      |> assign(:slide_5, false)
      |> assign(:slide_6, true)
    }
  end

  def render(assigns) do
    ~H"""
    <div class="mx-10">
      <%= if @slide_5 do %>
      <p class="text-2xl">
        Quais os principais motivos?
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

      <%= if @slide_6 do %>
        <.live_component module={FosterWeb.Components.Question61} id="question_61" path={@path}/>
        <% end %>
    </div>
    """
  end
end
