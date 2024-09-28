defmodule FosterWeb.Components.Question1 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok, 
      socket
      |> assign(:slide_1, true)
      |> assign(:slide_2, false)
    }
  end

  def update(%{branch: type}, socket) do
    {:ok, 
      socket
      |> assign(:type, type)
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
      |> assign(:slide_1, false)
      |> assign(:slide_2, true)
    }
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= check_path(assigns, @type) %>
    </div>

    """
  end

  defp check_path(assigns, :knowledge) do
    ~H"""
    <.live_component module={FosterWeb.Components.Question2} id="question_2" type={@type}/>
    """
  end
  defp check_path(assigns, :no_knowledge) do
    ~H"""
    <.live_component module={FosterWeb.Components.Question51} id="question_5" type={@type}/>
    """
  end
  defp check_path(assigns, :interested) do
    ~H"""
    <.live_component module={FosterWeb.Components.Question3} id="question_3" type={@type}/>
    """
  end
end
