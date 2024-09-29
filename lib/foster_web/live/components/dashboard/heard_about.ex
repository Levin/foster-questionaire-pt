defmodule FosterWeb.Components.Dashboard.HeardAbout do
  use FosterWeb, :live_component

  alias Contex.{Plot, Dataset, BarChart}

  def mount(socket) do
    regions = 
      Foster.Answers.all_answers()
      |> Enum.group_by(& &1.body["heard_about_fostering"])
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)]  end)

    dataset =
      Dataset.new(regions)

    plot = Contex.Plot.new(dataset, Contex.BarChart, 600, 400)

    {:ok, 
      socket
      |> assign(:plot, plot)
    }
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= Contex.Plot.to_svg(@plot) %>
    </div>
    """
  end

end
