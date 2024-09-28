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
    IO.inspect(params)
    {:noreply, 
      socket
      |> assign(:path, params["path"])
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
      <input type="radio" name="path" value="0" >
      <p class="font-nohemt">Não tenho conhecimento.</p>
      </div>
      <div class="flex items-center gap-2">
      <input type="radio" name="path" value="1" >
      <div>
      <p class="font-nohemt">Não tenho, mas gostava de ter.</p>
      </div>
      </div>
      <div class="flex items-center gap-2">
      <input type="radio" name="path" value="2">
      <p class="font-nohemt">Tenho.</p>
      </div>
      <.button>Submeter</.button>
      </.simple_form>


    </div>
      <% end %>
      <%= if @slide_1 do %>
        <.live_component module={FosterWeb.Components.Question1} id="question_1" branch={@path} />
        <% end %>
    </div>
    """
  end
end
