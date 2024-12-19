defmodule FosterWeb.InteractiveForm do
  use FosterWeb, :live_view

  alias FosterWeb.Sites.BaseQuestion
  alias FosterWeb.Sites.BaseInfopage

  @impl true
  def mount(_params, _session, socket) do
    pages = %{1 => :q0,
              2 => :q1,
              3 => :i0,
              4 => :q2,
              5 => :i1,
              6 => :q3,
              7 => :i2,
              8 => :q4,
              9 => :i3,
              10 => :q5,
              11 => :endpage,
            }
    {:ok,
      socket
      |> assign(:answers, %{})
      |> assign(:pages, pages)
      |> assign(:current_page, 1)
    }
  end


  @impl true
  def handle_event("next_page", _params, socket) do
    # logic to skip q1 if q0 is answered with 0 ie no_knolwedge
    # this is fishy, because of the info pages
    step = if socket.assigns.pages[socket.assigns.current_page] == :q0 and
              socket.assigns.answers[:q0] == "0" do
      2
    else
      1
    end

    {:noreply,
      socket
      |> assign(:current_page, min(map_size(socket.assigns.pages), socket.assigns.current_page + step))
      # |> IO.inspect(label: "Handle event next page")
    }
  end


  @impl true
  def handle_event("previous_page", _params, socket) do
    {:noreply,
      socket
      |> assign(:current_page, max(1, socket.assigns.current_page - 1))
      # |> IO.inspect(label: "Page #{socket.assigns.current_page}")
    }
  end


  @impl true
  def handle_info({:update_answers, answer}, socket) do
    updated_answers = Map.put(socket.assigns.answers,
                              socket.assigns.pages[socket.assigns.current_page],
                              answer)
    IO.inspect(updated_answers, label: "Answers")
    {:noreply,
      socket
      |> assign(:answers, updated_answers)
    }
  end

  defp get_image_source(page) when is_atom(page) do
    case Atom.to_string(page) do
      "i" <> _ -> "/images/bulb-icon.svg"
      "endpage" -> "/images/somekids.svg"
      _ -> "/images/somekids.svg"
    end
  end

  defp is_info_page(page) when is_atom(page) do
    case Atom.to_string(page) do
      "i" <> _ -> true
      _ -> false
    end
  end


  @impl true
  def render(assigns) do
    page = assigns.pages[assigns.current_page]
    image_source = get_image_source(page)
    ~H"""
    <div>
      <div class="mx-10">
        <div class="mb-4">
          <img src={image_source} />
        </div>
        <div>
          <%= if is_info_page(page) do %>
            <.live_component module={BaseInfopage} id={@current_page} current_page={page} />
          <% else %>
            <.live_component module={BaseQuestion} id={@current_page} current_page={page} />
            <% end %>
        </div>

        <%= if page != :endpage do %>
          <div class="h-56 grid grid-cols-3 gap-4 content-center">
            <form phx-submit="previous_page">
              <.button type="submit">Previous Page</.button>
            </form>
            <form phx-submit="next_page">
              <.button type="submit">Next Page</.button>
            </form>
          </div>
        <% end %>
      </div>
    </div>
    """
  end
end
