defmodule FosterWeb.Sites.Insights do
  use FosterWeb, :live_view


  def mount(params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <img src="/images/kids.svg" class=" mx-auto" />
      <div class="mx-10 mt-4">
        <div class="text-2xl font-nohemi font-bold">
          <p>O que sabem os</p>
          <p>Portuguses sobre</p>
          famílias de acolhimento?
        </div>

        <div class="h-10"></div>
        <div class="text-light_dark_matter text-xl">
          As famílias de acolhimento em Portugal desempenham um papel crucial na prestação de cuidados e apoio temporários às crianças que não podem viver com os seus pais biológicos. O sistema de acolhimento português, formalmente estabelecido em 2019, ainda é relativamente novo e em evolução, com o objetivo de garantir que as crianças cresçam em ambientes familiares e não em ambientes institucionais.
        </div>
      </div>

      <div class="h-10"></div>
       <%!--fostering questions  --%>
      <.live_component module={FosterWeb.Components.Dashboard.PriorKnolwedge} id="prior_knowledge" />
      <.live_component module={FosterWeb.Components.Dashboard.HeardWhere} id="heard_where" />
      <.live_component module={FosterWeb.Components.Dashboard.Likelihood} id="likelihood" />
      <.live_component module={FosterWeb.Components.Dashboard.Justification} id="justification" />
      <.live_component module={FosterWeb.Components.Dashboard.Challenges} id="challenges" />

      <%!-- demographics --%>
      <.live_component module={FosterWeb.Components.Dashboard.AgeSpans} id="age_spans" />
      <.live_component module={FosterWeb.Components.Dashboard.Gender} id="genders" />
      <.live_component module={FosterWeb.Components.Dashboard.Regions} id="regions" />
    </div>
    """
  end

end
