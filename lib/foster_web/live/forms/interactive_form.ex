defmodule FosterWeb.InteractiveForm do
  use FosterWeb, :live_view

  def mount(params, session, socket) do
    {:ok,
     socket
     |> assign(:slide_0, true)
     |> assign(:slide_1, false)}
  end

  def handle_event(
        "validate",
        %{
          "knowledge" => no_knowledge,
          "knowledge_false" => false_knowledge,
          "knowledge_interested" => interested_knowledge
        },
        socket
      ) do
    boxes = [
      {"no_knowledge", no_knowledge},
      {"false_knowledge", false_knowledge},
      {"interested_knowledge", interested_knowledge}
    ]

    case length(Enum.filter(boxes, fn {_id, item} -> item == "true" end)) do
      [{id, _value}] ->
        {:noreply,
         socket
         |> assign(:selected, id)}

      _ ->
        {:noreply, socket}
    end
  end

  def handle_event("submit", _params, socket) do
    {:noreply,
     socket
     |> assign(:slide_0, false)
     |> assign(:slide_1, true)}
  end

  def render(assigns) do
    ~H"""
    <.live_component module={FosterWeb.Components.Question0} id="base_slide" />
    """
  end
end
