defmodule FosterWeb.Components.Dashboard.MotivesFor do
  use FosterWeb, :live_component

  alias Contex.{Plot, Dataset, BarChart}

  def mount(socket) do
    motives_for =
      Foster.Answers.all_answers()
      |> Enum.group_by(& &1.body["motive_for_fostering"])
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)] end)

    dataset = Dataset.new(motives_for)

    IO.inspect(motives_for)

    plot = Contex.Plot.new(dataset, Contex.BarChart, 600, 400)

    {:ok,
     socket
     |> assign(:plot, plot)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= Contex.Plot.to_svg(@plot) %>
    </div>
    """
  end
end
