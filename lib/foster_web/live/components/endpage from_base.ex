defmodule FosterWeb.Components.Endpage do
  use FosterWeb, :live_component

  def mount(socket) do
    {:ok,
      socket
      |> assign(:url, "https://hack-foster.fly.dev/")
    }
  end

  # def update(params, socket) do
  #   Foster.Answers.create_answer(%{body: params.answers})

  #   {:ok,
  #     socket
  #     |> assign(:answers, params.answers)
  #   }
  # end

  def render(assigns) do
    ~H"""
    <div>
      <p class="text-2xl">
        Call to Action (incl. informações institucionais). Agradecimento e sugestão de partilha
      </p>

      <div class="mt-4">
        <p>Por favor, compartilhe nas redes sociais:</p>

        <div class="flex gap-4">
          <a href={"https://www.facebook.com/sharer/sharer.php?u=#{@url}"} target="_blank" class="text-blue-600">
            Facebook
          </a>
          <a href={"https://twitter.com/intent/tweet?url=#{@url}&text=Check%20this%20out!"} target="_blank" class="text-blue-400">
            Twitter
          </a>
          <a href={"https://www.linkedin.com/shareArticle?mini=true&url=#{@url}&title=Check%20this%20out!"} target="_blank" class="text-blue-700">
            LinkedIn
          </a>
          <a href={"mailto:?subject=Check%20this%20out!&body=#{@url}"} class="text-gray-600">
            Email
          </a>
        </div>
      </div>
    </div>
    """
  end
end
