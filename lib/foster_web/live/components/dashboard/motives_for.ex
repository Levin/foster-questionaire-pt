defmodule FosterWeb.Components.Dashboard.MotivesForTucan do
  use FosterWeb, :live_component

  @impl true
  def update(assigns, socket) do
    answers =
      Foster.Answers.all_answers()
      |> Enum.flat_map(fn answer ->
        case get_in(answer.body, ["q4", "motive_for_fostering"]) do
          nil -> []
          motives when is_list(motives) -> motives
          motive -> [motive]
        end
      end)
      |> Enum.frequencies()
      |> Enum.map(fn {motive, count} -> [motive, count] end)

    IO.inspect(answers)

    data = answers |> Enum.map(fn [motivo, count] -> %{"motivo" => motivo, "contagem" => count} end)

    plot = Tucan.bar(data, "motivo", "contagem",
    tooltip: true,
    orient: :horizontal,
    width: 300,
    height: 150)
    |> Tucan.set_title("Distribuição por motivo")
    |> VegaLite.to_spec()

    {:ok, push_event(socket, "draw_motives_for", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div id="motives_for" phx-hook="DrawMotivesFor" style="margin-top: 20px"></div>
    </div>
    """
  end
end
