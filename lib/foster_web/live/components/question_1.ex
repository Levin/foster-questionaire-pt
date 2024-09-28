defmodule FosterWeb.Components.Question1 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok, 
      socket
    }
  end

  def handle_event("submit", _params, socket) do
    {:noreply, 
     socket
    }
  end

  def render(assigns) do
    ~H"""
    <div>
    </div>
    """
  end
end
