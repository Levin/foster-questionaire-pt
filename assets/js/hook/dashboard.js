import vegaEmbed from 'vega-embed'

const Dashboard = {
  mounted() {
    this.handleEvent("draw_prior_knowledge", ({ spec }) => {
      const el = document.getElementById("prior-knowledge-chart")
      if (el) {
        vegaEmbed(el, spec)
          .then((result) => result.view)
          .catch((error) => console.error(error))
      }
    })

    this.handleEvent("draw_heard_where", ({ spec }) => {
      const el = document.getElementById("heard-where-chart")
      if (el) {
        vegaEmbed(el, spec)
          .then((result) => result.view)
          .catch((error) => console.error(error))
      }
    })

    this.handleEvent("draw_likelihood", ({ spec }) => {
      const el = document.getElementById("likelihood-chart")
      if (el) {
        vegaEmbed(el, spec)
          .then((result) => result.view)
          .catch((error) => console.error(error))
      }
    })

    this.handleEvent("draw_justification", ({ spec }) => {
      const el = document.getElementById("justification-chart")
      if (el) {
        vegaEmbed(el, spec)
          .then((result) => result.view)
          .catch((error) => console.error(error))
      }
    })

    this.handleEvent("draw_challenges", ({ spec }) => {
      const el = document.getElementById("challenges-chart")
      if (el) {
        vegaEmbed(el, spec)
          .then((result) => result.view)
          .catch((error) => console.error(error))
      }
    })

    this.handleEvent("draw_gender", ({ spec }) => {
      const el = document.getElementById("gender-chart")
      if (el) {
        vegaEmbed(el, spec)
          .then((result) => result.view)
          .catch((error) => console.error(error))
      }
    })

    this.handleEvent("draw_ages", ({ spec }) => {
      const el = document.getElementById("ages-chart")
      if (el) {
        vegaEmbed(el, spec)
          .then((result) => result.view)
          .catch((error) => console.error(error))
      }
    })

    this.handleEvent("draw_regions", ({ spec }) => {
      const el = document.getElementById("regions-chart")
      if (el) {
        vegaEmbed(el, spec)
          .then((result) => result.view)
          .catch((error) => console.error(error))
      }
    })

  },
}

export default Dashboard