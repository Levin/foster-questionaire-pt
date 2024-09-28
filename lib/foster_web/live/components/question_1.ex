defmodule FosterWeb.Components.Question1 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
      socket
      |> assign(:slide_1, true)
      |> assign(:slide_2, false)
      |> assign(:people, false)
      |> assign(:media, false)
      |> assign(:internet, false)
      |> assign(:social_media, false)
    }
  end

  def update(%{branch: type}, socket) do
    {:ok,
      socket
      |> assign(:path, type)
    }
  end

  def handle_event("validate", params, socket) do
    {:noreply,
      socket
      |> assign(:people, params["people"])
      |> assign(:media, params["media"])
      |> assign(:internet, params["internet"])
      |> assign(:social_media, params["social_media"])
    }
  end

  def handle_event("submit", _params, socket) do
    {:noreply,
      socket
      |> assign(:slide_1, false)
      |> assign(:slide_2, true)
    }
  end

  def render(assigns) do
    ~H"""
    <div>

      <%= check_path(assigns) %>
    </div>

      <.simple_form
      for={}
      phx-change="validate"
      phx-submit="submit"
      phx-target={@myself}
      >
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="people" checked={@people == "true"} />
        <div>
          <p class="font-nohemt">De pessoas</p>
        </div>
      </div>
      <div class="flex items-center gap-2">
        <.input type="checkbox" name="internet" checked={@internet == "true"} />
        <div>
          <p class="font-nohemt">Atraves internet</p>
        </div>
      </div>


  defp check_path(assigns) when assigns.path == "0" do
    ~H"""
    <.live_component module={FosterWeb.Components.Question2} id="question_2" path={@path}/>
    """
  end
  defp check_path(assigns) when assigns.path == "1" do
    ~H"""
    <.live_component module={FosterWeb.Components.Question3} id="question_3" path={@path}/>
    """
  end
  defp check_path(assigns) when assigns.path == "2" do
    ~H"""
    <.live_component module={FosterWeb.Components.Question51} id="question_5" path={@path}/>
    """
  end
end
