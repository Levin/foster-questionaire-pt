defmodule FosterWeb.Components.Question9 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok, 
      socket
      |> assign(:slide_9, true)
      |> assign(:slide_10, false)
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
      |> assign(:slide_9, false)
      |> assign(:slide_10, true)
    }
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= if @slide_9 do %>
        <div class="text-2xl font-nohemi">
        End
        </div>
        <% end %>
    </div>
    """
  end
end
