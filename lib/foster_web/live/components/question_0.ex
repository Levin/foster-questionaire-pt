defmodule FosterWeb.Components.Question0 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok, 
      socket
      |> assign(:slide_0, true)
      |> assign(:slide_1, false)
      |> assign(:is_true, false)
      |> assign(:no_knowledge, false)
      |> assign(:knowledge, false)
      |> assign(:interested, false)
    }
  end


  def handle_event("validate", params, socket) do
    {:noreply, 
      socket
      |> assign(:no_knowledge, params["no_knowledge"])
      |> assign(:knowledge, params["knowledge"])
      |> assign(:interested, params["interested"])
    }
  end

  def handle_event("submit", _params, socket) do
    {:noreply,
     socket
     |> assign(:slide_0, false)
     |> assign(:slide_1, true)
    }
  end

  def render(assigns) do
    ~H"""

    <div>
    <%= if @slide_0 do %>
    <div class="mx-10">
      <div class="mb-4">
        <img src="/images/somekids.svg" />
      </div>
      <p class="text-2xl">
        <span class="font-bold font-nohemi ">
          Já ouviu falar sobre famílias de acolhimento?
        </span>
        Ajude-nos a criar uma maior consciêncialização para famílias de acolhimento e explore diferentes estatísticas.
      </p>
      <p class="text-2xl text-light_dark_matter font-inter">
        Tens algum conhecimento sobre famílias de acolhimento em Portugal?
      </p>

      <.simple_form 
      for={} 
      phx-change="validate" 
      phx-submit="submit"
      phx-target={@myself}
      >
      <div class="flex items-center gap-2">
      <.input type="checkbox" name="no_knowledge" checked={@no_knowledge == "true"} />
      <p class="font-nohemt">Não tenho conhecimento.</p>
      </div>
      <div class="flex items-center gap-2">
      <.input type="checkbox" name="interested" checked={@interested == "true"} />
      <div>
      <p class="font-nohemt">Não tenho, mas gostava de ter.</p>
      </div>
      </div>
      <div class="flex items-center gap-2">
      <.input type="checkbox" name="knowledge" checked={@knowledge == "true"} />
      <p class="font-nohemt">Tenho.</p>
      </div>
      <.button>Submeter</.button>
      </.simple_form>


    </div>
      <% end %>
      <%= if @slide_1 do %>
        <.live_component module={FosterWeb.Components.Question1} id="question_1" branch={get_branch(assigns)} />
        <% end %>
    </div>
    """
  end


  defp get_branch(%{knowledge: "true"} = _params), do: :knowledge
  defp get_branch(%{no_knowledge: "true"} = _params), do: :no_knowledge
  defp get_branch(%{interested: "true"} = _params), do: :interested
end
