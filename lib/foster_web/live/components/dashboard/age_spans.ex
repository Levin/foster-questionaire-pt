defmodule FosterWeb.Components.Dashboard.AgeSpans do
  alias Foster.Answers.Answer
  use FosterWeb, :live_component

  def mount(socket) do
    spans =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> answer.body["agespan"] end)
      |> Enum.map(fn {groupname, answers} -> %{contagem: length(answers), opções: groupname} end)


    IO.inspect(spans, label: "spans")

    plot = Tucan.bar(spans, "opções", "contagem",
      tooltip: true,
      orient: :horizontal,
      corner_radius: 3)
      |> Tucan.set_title("Faixa etária de todos os participantes", anchor: :middle, offset: 15)
      |> VegaLite.to_spec()


    {:ok, push_event(socket, "draw_ages", %{"spec" => plot})}
  end

  def render(assigns) do
    ~H"""
    <div id="ages-chart" phx-hook="Dashboard"/>
    """
  end
end
