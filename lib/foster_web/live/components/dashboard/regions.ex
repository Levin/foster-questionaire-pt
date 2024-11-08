defmodule FosterWeb.Components.Dashboard.Regions do
  use FosterWeb, :live_component

  def mount(socket) do
    regions =
      Foster.Answers.all_answers()
      |> Enum.group_by(& &1.body["pt_region"])
      |> Enum.map(fn {groupname, answers} -> %{contagem: length(answers), opções: groupname} end)

    IO.inspect(regions, label: "regions")

    plot = Tucan.bar(regions, "opções", "contagem",
      tooltip: true,
      orient: :horizontal,
      corner_radius: 3)
      |> Tucan.set_title("Regiões de todos os participantes", anchor: :middle, offset: 15)
      |> VegaLite.to_spec()


    {:ok, push_event(socket, "draw_regions", %{"spec" => plot})}
  end

  def render(assigns) do
    ~H"""
    <div id="regions-chart" phx-hook="Dashboard"/>
    """
  end
end
