defmodule FosterWeb.Components.Dashboard.TotalForms do
  use FosterWeb, :live_component

  alias Contex.{Plot, Dataset, BarChart}

  def mount(socket) do
    total_calls = 
      Foster.Answers.all_answers()
      |> Enum.count()

    IO.inspect(total_calls)

    dataset = Dataset.new(total_calls)

    plot = Contex.Plot.new(dataset, Contex.BarChart, 600, 400)

    {:ok, 
      socket
      |> assign(:plot, plot)
    }
  end

  def render(assigns) do
    ~H"""
    <div>
      <%= Contex.Plot.to_svg(@plot) %>
    </div>
    """
  end

end
