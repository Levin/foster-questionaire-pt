defmodule FosterWeb.Components.Dashboard.Justification do
  use FosterWeb, :live_component

  alias Contex.{Plot, Dataset, BarChart}

  def mount(socket) do
    justification =
      Foster.Answers.all_answers()
      |> Enum.group_by(& &1.body["justification"])
      |> Enum.map(fn
        {groupname, answers} ->
        for name <- groupname do
          [name, length(answers)]
        end
      end)
      |> List.flatten()
      |> Enum.chunk_every(2)

    dataset = Dataset.new(justification)

    IO.inspect(justification)

    plot = Contex.Plot.new(dataset, Contex.BarChart, 600, 400,
    title: "Justificação da resposta de probabilidade",
      x_label: "opções",
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
