defmodule FosterWeb.Components.Dashboard.HeardTucan do
  use FosterWeb, :live_component

  @impl true
  def update(assigns, socket) do
    answers =
      Foster.Answers.all_answers()
      |> Enum.group_by(fn answer -> get_in(answer.body, ["q1", "heard_about_fostering"]) end)
      |> Enum.reject(fn {groupname, _answers} -> is_nil(groupname) end)  # Filter out nil age spans
      |> Enum.map(fn {groupname, answers} -> [groupname, length(answers)]  end)

    IO.inspect(answers)

    data = answers |> Enum.map(fn [heard_about, count] -> %{"ouvir_falar" => heard_about, "contagem" => count} end)

    plot = Tucan.bar(data, "ouvir_falar", "contagem",
    tooltip: true,
    orient: :horizontal,
    width: 300,
    height: 150,
    y: [
        sort: "-x",   # sort categories by contagem descending
        title: ""
      ]
    )
    |> Tucan.set_title("Conhecimento prévio")
    |> VegaLite.to_spec()

    {:ok, push_event(socket, "draw_heard_about", %{"spec" => plot})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div id="heard_about" phx-hook="DrawHeardAbout" style="margin-top: 20px; display: flex; justify-content: center;"></div>
    </div>
    """
  end

end
