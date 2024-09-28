defmodule FosterWeb.InteractiveForm do
  use FosterWeb, :live_view

  def mount(params, session, socket) do
    {:ok, 
      socket
      |> assign(:slide_0, true)
      |> assign(:slide_1, false)
      |> assign(:selected, nil)
    }
  end

  def handle_event("validate", %{"knowledge" => no_knowledge, "knowledge_false" => false_knowledge, "knowledge_interested" => interested_knowledge}, socket) do
    boxes = [{"no_knowledge", no_knowledge}, {"false_knowledge", false_knowledge}, {"interested_knowledge", interested_knowledge}]
    case length(Enum.filter(boxes, fn {_id, item} -> item == "true" end)) do
      [{id, _value}] -> 
        {:noreply, 
          socket
          |> assign(:selected, id)
        }
      _ -> 
        {:noreply, socket}
    end
  end

  def handle_event("submit", _params, socket) when socket.assigns.selected do
    {:noreply, 
      socket
      |> assign(:slide_0, false)
      |> assign(:slide_1, true)
    }
  end

  def handle_event("submit", _params, socket) do
    {:noreply, socket }
  end

  def render(assigns) do
    ~H"""
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


      <.simple_form for={} 
        phx-change="validate"
        phx-submit="submit"
        >
        <div class="flex items-center gap-2">
          <.input type="checkbox" name="knowledge_false" value="no-knowledge" class="" />
          <p class="font-nohemt">Não tenho conhecimento.</p>
        </div>
        <div class="flex items-center gap-2">
          <.input type="checkbox" name="knowledge_interested" value="no-knowledge-learn" />
          <div>
            <p class="font-nohemt">Não tenho, mas gostava de ter.</p>
          </div>
        </div>
        <div class="flex items-center gap-2">
          <.input type="checkbox" name="knowledge" value="some-knowledge" />
          <p class="font-nohemt">Tenho.</p>
        </div>
        <.button>Submeter</.button>
      </.simple_form>
    </div>
      <% end %>
    <%= if @slide_1 do %>
      <% end %>
    """
  end

end
