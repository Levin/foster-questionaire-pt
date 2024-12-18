defmodule FosterWeb.Sites.BaseQuestion do
  use FosterWeb, :live_component

  @page_components %{
    q0: FosterWeb.Components.Question0,
    q1: FosterWeb.Components.Question1,
    q2: FosterWeb.Components.Question2,
    q3: FosterWeb.Components.Question3,
    q4: FosterWeb.Components.Question4,
    q5: FosterWeb.Components.Question5,
    endpage: FosterWeb.Components.Endpage,
  }

  @impl true
  def render(assigns) do
    component = Map.get(@page_components, assigns.current_page)
    ~H"""
    <div>
      <.live_component module={component} id={@current_page} />
    </div>
    """
  end
end
