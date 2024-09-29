defmodule FosterWeb.Components.Dashboard.AgeSpans do
  use FosterWeb, :live_component

  alias Contex.Dataset

  def mount(socket) do
    spans =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> answer.body["agespan"] end)
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)] end)

    IO.inspect(spans)

    dataset = Dataset.new(spans, ["a", "b", "c", "d"])

    opts = [
      mapping: %{category_col: "a", value_col: "b"},
      colour_palette: ["fbb4ae", "b3cde3", "ccebc5", "dd2312"],
      legend_setting: :legend_right,
      data_labels: false,
      title: "Age-spans of all the participants"
    ]

    plot =
      Contex.Plot.new(dataset, Contex.PieChart, 600, 400, opts)

    {:ok,
     socket
     |> assign(:age_spans, spans)
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
