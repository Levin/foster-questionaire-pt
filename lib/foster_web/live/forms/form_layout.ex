defmodule FosterWeb.FormLayout do
  use FosterWeb, :live_view
  alias FosterWeb.Components.{Question0, Question1a}

  def mount(params, session, socket) do
    {:ok,
     socket
     |> assign(:question_0, true)
     |> assign(:question_1, false)
     |> assign(:question_2, false)
     |> assign(:question_3, false)
     |> assign(:question_4, false)
     |> assign(:question_5, false)
     |> assign(:question_6, false)
     |> assign(:question_7, false)
     |> assign(:question_8, false)
     |> assign(:is_true, false)
     |> assign(:no_knowledge, false)
     |> assign(:knowledge, false)
     |> assign(:people, false)
     |> assign(:media, false)
     |> assign(:internet, false)
     |> assign(:social_media, false)
     |> assign(:organizations, false)
     |> assign(:path, "")
     |> assign(:answers, %{})
     |> assign(:one, false)
     |> assign(:two, false)
     |> assign(:three, false)
     |> assign(:four, false)
     |> assign(:five, false)
     |> assign(:altruism, false)
     |> assign(:money, false)
     |> assign(:love, false)
     |> assign(:money, false)
     |> assign(:conditions, false)
     |> assign(:fear1, false)
     |> assign(:fear2, false)}
  end

  def render(assigns) do
    ~H"""
    <%= if @slide_0 do %>
      <.live_component module={Question0} id="base_slide" />
    <% end %>

    <%= if @slide_1 do %>
      <.live_component module={Question1a} id="question_1_a" path={@path} answers={@answers} />
    <% end %>
    <%= if @slide_2 do %>
      <.live_component module={Question2} id="question_2" path={@path} answers={@answers} />
    <% end %>
    <%= if @slide_3 do %>
      <.live_component
        module={FosterWeb.Components.Question3}
        id="question_3"
        branch={assigns.path}
        answers={@answers}
      />
    <% end %>
    <%= if @slide_4 do %>
      <.live_component
        module={FosterWeb.Components.Question4}
        id="question_4"
        path={@path}
        answers={@answers}
      />
    <% end %>
    <%= if @slide_5 do %>
      <.live_component
        module={FosterWeb.Components.Question5}
        id="question_5"
        path={@path}
        answers={@answers}
      />
    <% end %>
    """
  end
end
