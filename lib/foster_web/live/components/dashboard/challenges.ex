defmodule FosterWeb.Components.Dashboard.Challenges do
  alias Foster.Answers.Answer
  use FosterWeb, :live_component

  alias Contex.{Plot, Dataset, BarChart}

  def mount(socket) do
    challenges =
    Foster.Answers.all_answers()
    |> Enum.flat_map(fn %Answer{body: body} ->
      case Map.get(body, "challenges", []) do
        list when is_list(list) -> list
        value -> [value]
      end
    end)
    |> Enum.group_by(& &1)
    |> Enum.map(fn {topic, answers} ->
      %{"contagem" => length(answers), "opções" => topic}
    end)

    IO.inspect(challenges, label: "challenges")

    plot = Tucan.bar(challenges, "opções", "contagem",
      tooltip: true,
      orient: :horizontal,
      corner_radius: 3)
      |> Tucan.set_title("Desafios para se tornar uma família de acolhimento", anchor: :middle, offset: 15)
      |> VegaLite.to_spec()


    {:ok, push_event(socket, "draw_challenges", %{"spec" => plot})}
  end

  def render(assigns) do
    ~H"""
    <div id="challenges-chart" phx-hook="Dashboard"/>
    """
  end
end
