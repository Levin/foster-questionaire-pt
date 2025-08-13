defmodule FosterWeb.Components.Dashboard.AgeSpansTucan do
  use FosterWeb, :live_component

  @impl true
  def update(assigns, socket) do
    spans =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> get_in(answer.body, ["q2", "agespan"]) end)
      |> Enum.reject(fn {groupname, _answers} -> is_nil(groupname) end)  # Filter out nil age spans
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)]  end)

    # Convert to data format suitable for Tucan
    data = spans |> Enum.map(fn [age, count] -> %{"idade" => age, "contagem" => count} end)

    plot = Tucan.bar(data, "idade", "contagem",
    tooltip: true,
    orient: :horizontal,
    width: 300,
    height: 150)
    |> Tucan.set_title("Faixa etária de todos os participantes")
    |> VegaLite.to_spec()

    {:ok, push_event(socket, "draw_spans", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <%!-- <span class="font-nohemi ">
        Portugal está em último lugar na Europa. Vamos fazer melhor?
      </span> --%>
      <div id="spans" phx-hook="DrawSpans" style="margin-top: 20px"></div>
    </div>
    """
  end
end
