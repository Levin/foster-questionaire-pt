defmodule FosterWeb.Components.Dashboard.PriorKnolwedge do
  use FosterWeb, :live_component

  def mount(socket) do
    knowledge =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> answer.body["knowledge"] end)
      |> Enum.map(fn {groupname, answers} -> %{contagem: length(answers), opções: groupname} end)

    plot = Tucan.pie(knowledge, "contagem", "opções", tooltip: true)
      |> Tucan.set_title("Conhecimento prévio", anchor: :middle, offset: 15)
      |> VegaLite.to_spec()

    {:ok, push_event(socket, "draw_prior_knowledge", %{"spec" => plot})}
  end

  def render(assigns) do
    ~H"""
    <div id="prior-knowledge-chart" phx-hook="Dashboard"/>
    """
  end
end
