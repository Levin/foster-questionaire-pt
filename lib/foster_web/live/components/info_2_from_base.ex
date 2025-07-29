defmodule FosterWeb.Components.Info2 do
  use FosterWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <span class="font-bold font-nohemi ">
        As Verdades sobre o Acolhimento Familiar
      </span>

      <div>
        <ul>
          <li style="margin-top: 20px">
            <span class="font-nohemi ">
              Qualquer pessoa ou casal pode ser a Família de Acolhimento, independentemente do estado civil, orientação sexual, religião, nacionalidade, raça, etnia, idade, situação económica, formação académica ou profissional.
            </span>
          </li>
          <li style="margin-top: 20px">
            <span class="font-nohemi ">
              A única exigência é ter mais de 25 anos e residir em Portugal.
            </span>
          </li>
          <li style="margin-top: 20px">
            <span class="font-nohemi ">
            Família de Acolhimento tem a possibilidade de continuar a acompanhar a trajetória futura da criança que acolheu.
            </span>
          </li>
          <li style="margin-top: 20px">
            <span class="font-nohemi ">
              Conseguir um vínculo forte no curto prazo com a criança é muito melhor do que falta de vínculo na instituição.
            </span>
          </li>
        </ul>
      </div>
    </div>
    """
  end
end


###### Replicate some plot here #######
# defmodule FosterWeb.Components.Dashboard.AgeSpans do
#   alias Foster.Answers.Answer
#   use FosterWeb, :live_component

#   def mount(socket) do
#     spans =
#       Foster.Answers.all_answers()
#       |> Enum.group_by(fn answer -> answer.body["agespan"] end)
#       |> Enum.map(fn {groupname, answers} -> %{contagem: length(answers), opções: groupname} end)


#     IO.inspect(spans, label: "spans")

#     plot = Tucan.bar(spans, "opções", "contagem",
#       tooltip: true,
#       orient: :horizontal,
#       corner_radius: 3)
#       |> Tucan.set_title("Faixa etária de todos os participantes", anchor: :middle, offset: 15)
#       |> VegaLite.to_spec()


#     {:ok, push_event(socket, "draw_ages", %{"spec" => plot})}
#   end

#   def render(assigns) do
#     ~H"""
#     <div id="ages-chart" phx-hook="Dashboard"/>
#     """
#   end
# end
