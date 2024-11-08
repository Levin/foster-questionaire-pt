defmodule FosterWeb.Components.Dashboard.Gender do
  use FosterWeb, :live_component

  alias Contex.Dataset

  def mount(socket) do
    genders =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> answer.body["gender"] end)
      |> Enum.map(fn {groupname, answers} -> %{contagem: length(answers), opções: groupname} end)

    plot = Tucan.pie(genders, "contagem", "opções", tooltip: true)
      |> Tucan.set_title("Distribuição de género", anchor: :middle, offset: 15)
      |> VegaLite.to_spec()

    {:ok, push_event(socket, "draw_gender", %{"spec" => plot})}
  end


  def render(assigns) do
    ~H"""
    <div id="gender-chart" phx-hook="Dashboard"/>
    """
  end
end
