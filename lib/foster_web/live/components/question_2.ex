defmodule FosterWeb.Components.Question2 do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
      socket
      |> assign(:slide_2, true)
      |> assign(:slide_3, false)
      |> assign(:name, "")
      |> assign(:email, "")
      |> assign(:age, nil)
      |> assign(:education, "")
    }
  end

  def update(params, socket) do
    IO.inspect(params)
    {:ok,
      socket
      |> assign(:path, params["type"])
    }
  end

  def handle_event("validate", params, socket) do
    {:noreply,
      socket
      |> assign(:name, params["name"])
      |> assign(:email, params["email"])
      |> assign(:age, params["age"])
      |> assign(:education, params["education"])
    }
  end

  def handle_event("submit", _params, socket) do
    {:noreply,
      socket
      |> assign(:slide_2, false)
      |> assign(:slide_3, true)
    }
  end

  def render(assigns) do
    ~H"""
    <div>
    <%= if @slide_2 do %>
    <div class="mx-10">
      <div class="mb-4">
        <img src="/images/somekids.svg" />
      </div>
      <p class="text-2xl text-light_dark_matter font-inter">
        Breves dados demográficos
      </p>

      <.simple_form
        for={}
        phx-change="validate"
        phx-submit="submit"
        phx-target={@myself}
        >
      <div class="flex items-center gap-2">
        <.label>Your Name</.label>
        <.input name="name" value="" placeholder="Name"/>

      </div>

      <div class="flex items-center gap-2">
        <.label>Your Email</.label>
        <.input name="email" value="" placeholder="Email"/>
      </div>

      <div class="flex items-center gap-2">
        <.label>Your Age</.label>
        <.input name="age" value="" placeholder="Age"/>
      </div>
      <div class="flex items-center gap-2">
        <.label>Your Education</.label>
        <.input name="education" value="" placeholder="Education"/>
      </div>
      <.button>Submeter</.button>
      </.simple_form>

      </div>
      <% end %>
      <%= if @slide_3 do %>
        <.live_component module={FosterWeb.Components.Question3} id="question_3" branch={assigns.path} />
      <% end %>
    </div>
    """
  end
end
