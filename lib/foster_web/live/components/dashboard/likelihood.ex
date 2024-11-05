defmodule FosterWeb.Components.Dashboard.Likelihood do
  use FosterWeb, :live_component

  alias Contex.{Plot, Dataset, BarChart}

  def mount(socket) do
    likelihood =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> answer.body["becoming_foster"] end)
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)] end)


    dataset =
      Dataset.new(likelihood)

    IO.inspect(likelihood, label: "likelihood")
    IO.inspect(dataset, label: "dataset")

    plot = Contex.Plot.new(dataset, Contex.BarChart, 600, 400,
      title: "Probabilidade de acolhimento",
      x_label: "Probabilidade",
      y_label: "Contagem")

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
