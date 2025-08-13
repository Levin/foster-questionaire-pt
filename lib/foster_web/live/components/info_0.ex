defmodule FosterWeb.Components.Info0 do
  use FosterWeb, :live_component

  @impl true
  def mount(socket) do
    data = [
      %{" " => "Cuidados residenciais", "número de crianças" => 5638},
      %{" " => "Cuidados na família", "número de crianças" => 144},
      %{" " => "Outro", "número de crianças" => 170}
    ]

    plot = Tucan.bar(data, " ", "número de crianças",
    tooltip: true,
    orient: :horizontal,
    color_by: " ",
    corner_radius: 3,
    height: 200)
    |> Tucan.set_title("Número total de crianças em cuidados alternativos", anchor: :middle, offset: 15)
    |> VegaLite.to_spec()

    {:ok, push_event(socket, "draw_pt_stats", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <span class="font-nohemi ">
        <b>95% das crianças</b> acolhidas no âmbito do Sistema de Promoção e Proteção encontram-se em acolhimento residencial, o que representa <b>o valor mais elevado entre os 42 países</b> analisados.
      </span>

      <div style="margin-top: 20px" id="pt_numbers" phx-hook="DrawPTnumbers"></div>
    </div>
    """
  end
end
