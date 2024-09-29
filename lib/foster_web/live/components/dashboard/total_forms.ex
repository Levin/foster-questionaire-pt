defmodule FosterWeb.Components.Dashboard.TotalForms do
  use FosterWeb, :live_component

  def mount(socket) do
    total_calls =
      Foster.Answers.all_answers()
      |> Enum.count()

    IO.inspect(total_calls)

    {:ok,
     socket
     |> assign(:total, total_calls)}
  end

  def render(assigns) do
    ~H"""
    <div></div>
    """
  end
end
