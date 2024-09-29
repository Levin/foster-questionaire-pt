defmodule FosterWeb.Components.Dashboard.HeardAbout do
  use FosterWeb, :live_component

  alias Contex.{Plot, Dataset, BarChart}

  def mount(socket) do
    heard_about = 
      Foster.Answers.all_answers()
      |> Enum.group_by(& &1.body["heard_about_fostering"])
      |> Enum.map(fn
        {groupname, answers} -> 
        for name <- groupname do
          [name, length(answers)]  
        end
      end)
      |> List.flatten()
      |> Enum.chunk_every(2)


    dataset =
      Dataset.new(heard_about)

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
