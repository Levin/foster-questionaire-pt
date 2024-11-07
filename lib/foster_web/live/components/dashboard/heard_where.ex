defmodule FosterWeb.Components.Dashboard.HeardAbout do
  alias Foster.Answers.Answer
  use FosterWeb, :live_component

  alias Contex.{Plot, Dataset, BarChart}

  def mount(socket) do
    heard_about =
      Foster.Answers.all_answers()
      |> Enum.map(fn %Answer{body: body} ->
        Map.get(body, "heard_about_fostering", "no_anwser")
      end)
      |> Enum.group_by(& &1)
      |> Enum.to_list()
      |> Enum.map(fn {topic, answers} -> [topic, length(answers)] end)

    dataset =
      Dataset.new(heard_about)

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
