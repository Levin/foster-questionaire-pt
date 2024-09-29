defmodule FosterWeb.Components.Question51 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok, 
      socket
      |> assign(:slide_5, true)
      |> assign(:slide_6, false)
    }
  end

  def update(%{path: path, answers: answers}, socket) do
    IO.inspect("answers in question 51")
    IO.inspect(answers)
    {:ok, 
      socket
      |> assign(:path, path)
      |> assign(:answers, answers)
    }
  end

  def handle_event("validate", params, socket) do
    {:noreply, 
      socket
    }
  end

  def handle_event("submit", params, socket) do
    updated_answers = 
      Map.put(socket.assigns.answers, :question_51, params["question_51"])

    {:noreply,
      socket
      |> assign(:answers, updated_answers)
      |> assign(:slide_5, false)
      |> assign(:slide_6, true)
    }
  end

  def render(assigns) do
    ~H"""
    <div class="mx-10">
      <%= if @slide_5 do %>
      <p class="text-2xl">
        Quais os principais motivos?
      </p>

      <.simple_form 
      for={} 
      phx-change="validate" 
      phx-submit="submit"
      phx-target={@myself}
      >
        <div class="flex items-center gap-2">
        <input type="radio" name="question_51" value="0" />
        <p class="font-nohemt">Yes</p>
        </div>
        <div class="flex items-center gap-2">
        <input type="radio" name="question_51" value="1" />
        <p class="font-nohemt">No</p>
        </div>
      <.button>Submeter</.button>
      </.simple_form>
        <% end %>

      <%= if @slide_6 do %>
        <.live_component module={FosterWeb.Components.Question61} id="question_61" path={@path} answers={@answers}/>
        <% end %>
    </div>
    """
  end
end
