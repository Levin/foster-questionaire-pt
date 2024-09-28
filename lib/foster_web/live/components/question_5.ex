defmodule FosterWeb.Components.Question5 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok, 
      socket
      |> assign(:slide_5, true)
      |> assign(:slide_6, false)
    }
  end

  def update(params, socket) do
    IO.inspect(params)
    {:ok, 
      socket
      |> assign(:path, params["path"])
    }
  end

  def handle_event("validate", params, socket) do
    {:noreply, 
      socket
      |> assign(:path, params["path"])
    }
  end

  def handle_event("submit", _params, socket) do
    {:noreply,
      socket
      |> assign(:slide_5, false)
      |> assign(:slide_6, true)
    }
  end

  def render(assigns) do
    ~H"""
    <div class="mx-10">
      <%= if @slide_5 do %>
      <p class="text-2xl">
        Consideraria ser uma Família de Acolhimento?
      </p>

      <.simple_form 
      for={} 
      phx-change="validate" 
      phx-submit="submit"
      phx-target={@myself}
      >
        <div class="flex items-center gap-2">
        <input type="radio" name="motivos" value="0" />
        <p class="font-nohemt">Yes</p>
        </div>
        <div class="flex items-center gap-2">
        <input type="radio" name="motivos" value="1" />
        <p class="font-nohemt">No</p>
        </div>
 
      <.button>Submeter</.button>
      </.simple_form>
        <% end %>

      <%= if @slide_6 do %>
        <%= check_path(assigns) %>
        <.live_component module={FosterWeb.Components.Question6} id="question_6" type={@type}/>
        <% end %>
    </div>
    """
  end

  defp check_path(assigns) do

    if assigns["path"] do
      ~H"""
      <.live_component module={FosterWeb.Components.Question6} id="question_6" type={@type}/>
      """
    else
      ~H"""
      <.live_component module={FosterWeb.Components.Question51} id="question_51" type={@type}/>
      """
    end
  end
end
