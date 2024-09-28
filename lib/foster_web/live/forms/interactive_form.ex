defmodule FosterWeb.InteractiveForm do
  use FosterWeb, :live_view


  def mount(params, session, socket) do
    {:ok, socket}
  end


  def render(assigns) do
    ~H"""
      <div>
        Welcome to the Hackathon on Foster Care
      </div>
    """
  end
end
