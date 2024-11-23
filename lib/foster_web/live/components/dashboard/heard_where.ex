defmodule FosterWeb.Components.Dashboard.HeardWhere do
  alias Foster.Answers.Answer
  use FosterWeb, :live_component

  def mount(socket) do
      heard_where =
      Foster.Answers.all_answers()
      |> Enum.flat_map(fn %Answer{body: body} ->
        case Map.get(body, "heard_where", []) do
          list when is_list(list) -> list
          value -> [value]
        end
      end)
      |> Enum.group_by(& &1)
      |> Enum.map(fn {topic, answers} ->
        %{"contagem" => length(answers), "opções" => topic}
      end)

    plot = Tucan.bar(heard_where, "opções", "contagem",
      tooltip: true,
      orient: :horizontal,
      corner_radius: 3)
      |> Tucan.set_title("Fonte de informação", anchor: :middle, offset: 15)
      |> VegaLite.to_spec()


    {:ok, push_event(socket, "draw_heard_where", %{"spec" => plot})}
  end

  def render(assigns) do
    ~H"""
    <div id="heard-where-chart" phx-hook="Dashboard"/>
    """
  end
end
