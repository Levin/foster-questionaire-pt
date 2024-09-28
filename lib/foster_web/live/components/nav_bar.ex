defmodule FosterWeb.Components.NavBar do
  use FosterWeb, :live_component

  @languages ["EN", "PT"]

  def update(params, socket) do
    {:ok, 
      socket
      |> assign(:languages, @languages)
    }
  end

  def render(assigns) do
    ~H"""
    <div class="flex justify-center gap-3 font-nohami pt-6">
      <div>
        Home
      </div>
      <div>
        Date Insights
      </div>
      <div>
        EN
      </div>
    </div>
    """
  end


end
