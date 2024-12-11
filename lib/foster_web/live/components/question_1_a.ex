defmodule FosterWeb.Components.Question1aOld do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
     socket
     |> assign(:slide_1, true)
     |> assign(:slide_2, false)}
  end

  def update(%{path: path, answers: answers} = params, socket) do
    {:ok,
     socket
     |> assign(:path, path)
     |> assign(:answers, answers)
    }
  end

  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  def handle_event("submit", _params, socket) do
    {:noreply,
     socket
      |> assign(:answers, socket.assigns.answers)
      |> assign(:path, socket.assigns.path)
      |> assign(:slide_1, false)
      |> assign(:slide_2, true)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= check_path(assigns) %>
    </div>
    """
  end

  defp check_path(assigns) when assigns.path == "0" do
    ~H"""
    <.live_component module={FosterWeb.Components.Question2} id="question_2" path={@path} answers={@answers}/>
    """
  end

  defp check_path(assigns) when assigns.path == "1" do
    ~H"""
    <.live_component module={FosterWeb.Components.Question1b} id="question_1_b" path={@path} answers={@answers}/>
    """
  end
end
