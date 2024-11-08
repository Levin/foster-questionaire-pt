defmodule FosterWeb.Components.Dashboard.HearWhere do
  use FosterWeb, :live_component

  alias Contex.{Plot, Dataset, BarChart}

  def mount(socket) do
    heard_where =
      Foster.Answers.all_answers()
      |> Enum.map(fn %Answer{body: body} ->
        Map.get(body, "heard_about_fostering", "no_anwser")
      end)
      |> Enum.group_by(& &1)
      |> Enum.to_list()
      |> Enum.map(fn {topic, answers} -> [topic, length(answers)] end)

    dataset =
      Dataset.new(heard_where)

    IO.inspect(heard_where, label: "heard_where")
    IO.inspect(dataset, label: "dataset")

    plot = Contex.Plot.new(dataset, Contex.BarChart, 600, 400,
      title: "Fonte de informação",
      x_label: "Fontes",
      y_label: "Contagem")

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
