defmodule FosterWeb.Components.Dashboard.PriorKnolwedge do
  use FosterWeb, :live_component

  alias Contex.Dataset

  def mount(socket) do
    knowledge =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> answer.body["knowledge"] end)
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)] end)

    dataset = Dataset.new(knowledge, ["a", "b", "c", "d"])

    opts = [
      mapping: %{category_col: "a", value_col: "b"},
      colour_palette: ["fbb4ae", "b3cde3", "ccebc5", "dd2312"],
      legend_setting: :legend_right,
      data_labels: true,
      title: "Conhecimento prévio"
    ]

    plot =
      Contex.Plot.new(dataset, Contex.PieChart, 600, 400, opts)

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
