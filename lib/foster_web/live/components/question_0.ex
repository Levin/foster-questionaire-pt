defmodule FosterWeb.Components.Question0 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok, socket}
  end

  def handle_event("submit", _params, socket) do
    {:noreply,
     socket
     |> assign(:slide_0, false)
     |> assign(:slide_1, true)}
  end

  def render(assigns) do
    ~H"""
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

      <.simple_form for={} phx-change="validate" phx-submit="submit">
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
    """
  end
end
