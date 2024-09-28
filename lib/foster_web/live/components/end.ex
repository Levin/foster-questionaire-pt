defmodule FosterWeb.Components.End do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok, 
      socket
    }
  end

  def update(params, socket) do
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
    }
  end

  def render(assigns) do
    ~H"""
    <div>
      The End
    </div>
    """
  end
end
