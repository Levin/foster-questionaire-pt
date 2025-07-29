defmodule FosterWeb.Components.Dashboard.RegionsTucan do
  use FosterWeb, :live_component

  @impl true
  def update(assigns, socket) do
    answers =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> get_in(answer.body, ["q2", "pt_region"]) end)
      |> Enum.reject(fn {groupname, _answers} -> is_nil(groupname) end)  # Filter out nil age spans
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)]  end)

    IO.inspect(answers)

    data = answers |> Enum.map(fn [region, count] -> %{"regiao" => region, "contagem" => count} end)

    plot = Tucan.bar(data, "regiao", "contagem",
    tooltip: true,
    orient: :horizontal,
    width: 300,
    height: 150)
    |> Tucan.set_title("Distribuição por região")
    |> VegaLite.to_spec()

    {:ok, push_event(socket, "draw_region", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div id="region" phx-hook="DrawRegion" style="margin-top: 20px"></div>
    </div>
    """
  end
end
