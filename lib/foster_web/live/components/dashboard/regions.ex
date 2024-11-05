defmodule FosterWeb.Components.Dashboard.Regions do
  use FosterWeb, :live_component

  alias Contex.{Plot, Dataset, BarChart}

  def mount(socket) do
    regions =
      Foster.Answers.all_answers()
      |> Enum.group_by(& &1.body["pt_region"])
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)]  end)

    dataset =
      Dataset.new(regions)

    #  TODO: I want y labels in integers
    plot = Contex.Plot.new(dataset, Contex.BarChart, 600, 400,
      data_labels: true,
      title: "Regiões de todos os participantes",
      custom_y_labels: &integer_labels/1,
      custom_y_tick_labels: &integer_labels/1
    )

    {:ok,
      socket
      |> assign(:plot, plot)
    }
  end

  defp integer_labels(value) do
    Integer.to_string(value)
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= Contex.Plot.to_svg(@plot) %>
    </div>
    """
  end

end
