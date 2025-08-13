defmodule FosterWeb.Components.Dashboard.Likelihood do
  alias Foster.Answers.Answer
  use FosterWeb, :live_component

  def mount(socket) do
    likelihood =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> answer.body["becoming_foster"] end)
      |> Enum.map(fn {groupname, answers} -> %{contagem: length(answers), opções: groupname} end)

    IO.inspect(likelihood, label: "likelihood")

    plot = Tucan.bar(likelihood, "opções", "contagem",
      tooltip: true,
      orient: :horizontal,
      corner_radius: 3)
      |> Tucan.set_title("Probabilidade de acolhimento", anchor: :middle, offset: 15)
      |> VegaLite.to_spec()


    {:ok, push_event(socket, "draw_likelihood", %{"spec" => plot})}
  end

  def render(assigns) do
    ~H"""
    <div id="likelihood-chart" phx-hook="Dashboard"/>
    """
  end
end
