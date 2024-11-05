defmodule FosterWeb.Components.Dashboard.Justification do
  use FosterWeb, :live_component

  alias Contex.{Plot, Dataset, BarChart}

  def mount(socket) do
    justification =
      Foster.Answers.all_answers()
      |> Enum.map(fn answer -> answer.body["justification"] end)
      |> List.flatten

    dataset = Dataset.new(justification)

    IO.inspect(justification)

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
