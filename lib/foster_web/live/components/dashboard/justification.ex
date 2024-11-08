defmodule FosterWeb.Components.Dashboard.Justification do
  alias Foster.Answers.Answer
  use FosterWeb, :live_component

  def mount(socket) do
    justification =
      Foster.Answers.all_answers()
      |> Enum.flat_map(fn %Answer{body: body} ->
        case Map.get(body, "justification", []) do
          list when is_list(list) -> list
          value -> [value]
        end
      end)
      |> Enum.group_by(& &1)
      |> Enum.map(fn {topic, answers} ->
        %{"contagem" => length(answers), "opções" => topic}
      end)

    IO.inspect(justification, label: "justification")

    plot = Tucan.bar(justification, "opções", "contagem",
      tooltip: true,
      orient: :horizontal,
      corner_radius: 3)
      |> Tucan.set_title("Justificação da resposta de probabilidade", anchor: :middle, offset: 15)
      |> VegaLite.to_spec()


    {:ok, push_event(socket, "draw_justification", %{"spec" => plot})}
  end

  def render(assigns) do
    ~H"""
    <div id="justification-chart" phx-hook="Dashboard"/>
    """
  end
end
