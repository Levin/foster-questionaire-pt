defmodule FosterWeb.Components.Dashboard.ProbForTucan do
  use FosterWeb, :live_component

  @impl true
  def update(assigns, socket) do
    answers =
      Foster.Answers.all_answers()
      # |> Enum.group_by(fn answer -> get_in(answer.body["q3"]) end)
      |> Enum.group_by(fn answer -> get_in(answer.body, ["q3"]) end)
      |> Enum.reject(fn {groupname, _answers} -> is_nil(groupname) end)  # Filter out nil age spans
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)]  end)

    IO.inspect(answers)

    data = answers |> Enum.map(fn [inclination, count] -> %{"inclinação" => inclination, "contagem" => count} end)

    plot = Tucan.bar(data, "inclinação", "contagem",
    tooltip: true,
    orient: :horizontal,
    width: 300,
    height: 150)
    |> Tucan.set_title("Inclinação para acolhimento (5 = muito provável)")
    |> VegaLite.to_spec()

    {:ok, push_event(socket, "draw_prob_for", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div id="probability" phx-hook="DrawProbFor" style="margin-top: 20px"></div>
    </div>
    """
  end
end
