defmodule FosterWeb.Components.Question1 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
     socket
     |> assign(:slide_1, true)
     |> assign(:slide_2, false)}
  end

  def update(%{branch: type, answers: answers} = params, socket) do
    {:ok,
     socket
     |> assign(:path, type)
     |> assign(:answers, answers)}
  end

  def handle_event("validate", params, socket) do
    {:noreply, socket}
  end

  def handle_event("submit", _params, socket) do
    {:noreply,
     socket
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
    <.live_component
      module={FosterWeb.Components.Question51}
      id="question_5"
      path={@path}
      answers={@answers}
    />
    """
  end

  defp check_path(assigns) when assigns.path == "1" do
    ~H"""
    <.live_component
      module={FosterWeb.Components.Question2}
      id="question_2"
      path={@path}
      answers={@answers}
    />
    """
  end

  defp check_path(assigns) when assigns.path == "2" do
    ~H"""
    <.live_component
      module={FosterWeb.Components.Question11}
      id="question_1_1"
      path={@path}
      answers={@answers}
    />
    """
  end
end
