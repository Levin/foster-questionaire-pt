defmodule FosterWeb.Components.Dashboard.GenderTucan do
  use FosterWeb, :live_component

  @impl true
  def update(assigns, socket) do
    genders =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> get_in(answer.body, ["q2", "gender"]) end)
      |> Enum.reject(fn {groupname, _answers} -> is_nil(groupname) end)  # Filter out nil age spans
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)]  end)

    IO.inspect(genders)

    data = genders |> Enum.map(fn [gender, count] -> %{"genero" => gender, "contagem" => count} end)

    plot = Tucan.bar(data, "genero", "contagem",
    tooltip: true,
    orient: :horizontal,
    width: 300,
    height: 150)
    |> Tucan.set_title("Distribuição por género")
    |> VegaLite.to_spec()

    {:ok, push_event(socket, "draw_gender", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div id="gender" phx-hook="DrawGender" style="margin-top: 20px"></div>
    </div>
    """
  end
end
