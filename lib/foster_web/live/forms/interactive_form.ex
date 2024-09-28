defmodule FosterWeb.InteractiveForm do
  use FosterWeb, :live_view


  def mount(params, session, socket) do
    {:ok, socket}
  end


  def render(assigns) do
    ~H"""
    <div>
      <div>
        Welcome to the Hackathon on Foster Care
      </div>
      <.simple_form 
        for={}
        >
      <.label>Your Name</.label>
      <.input name="name" value="" placeholder="Name"/>
      <.label>Your Age</.label>
      <.input name="age" value="" placeholder="Name"/>
      <.label>Your Family Members</.label>
      <.input name="members" value="" placeholder="Name"/>
      <.label>Amount of spare Rooms</.label>
      <.input name="" value="" placeholder="Name"/>
      </.simple_form>
    </div>
    """
  end
end
