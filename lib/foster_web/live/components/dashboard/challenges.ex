defmodule FosterWeb.Components.Dashboard.Challenges do
  use FosterWeb, :live_component

  alias Contex.{Plot, Dataset, BarChart}

  def mount(socket) do
    challenges =
    Foster.Answers.all_answers()
    |> Enum.group_by(& &1.body["challenges"])
    |> Enum.map(fn
      {groupname, answers} ->
      for name <- groupname do
        [name, length(answers)]
      end
    end)
    |> List.flatten()
    |> Enum.chunk_every(2)

    IO.inspect(challenges)

    dataset =
      Dataset.new(challenges)

    plot = Contex.Plot.new(dataset, Contex.BarChart, 600, 400,
      title: "Desafios para se tornar uma família de acolhimento",
      x_label: "Desafios",
      y_label: "Contagem",
      padding: 20
      )

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
