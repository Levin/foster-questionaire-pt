defmodule FosterWeb.Components.Dashboard.Gender do
  use FosterWeb, :live_component

  alias Contex.Dataset

  def mount(socket) do
    genders = 
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> answer.body["gender"] end)
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)]  end)

    IO.inspect(genders)

    dataset = Dataset.new(genders, ["a", "b", "c", "d"])

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
