import * as vega from 'vega';
import * as vl from 'vega-lite';
import { Handler } from 'vega-tooltip';

let DrawPTnumbers = {
  mounted() {
    this.handleEvent("draw_pt_stats", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#pt_numbers')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};


let DrawEUnumbers = {
  mounted() {
    this.handleEvent("draw_eu_stats", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#eu_numbers')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

let DrawSpans = {
  mounted() {
    this.handleEvent("draw_spans", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#spans')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

let DrawGender = {
  mounted() {
    this.handleEvent("draw_gender", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#gender')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

let DrawHeardAbout = {
  mounted() {
    this.handleEvent("draw_heard_about", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#heard_about')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

let DrawRegion = {
  mounted() {
    this.handleEvent("draw_region", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#region')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

let DrawProbFor = {
  mounted() {
    this.handleEvent("draw_prob_for", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#probability')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

let DrawMotivesFor = {
  mounted() {
    this.handleEvent("draw_motives_for", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#motives_for')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

let DrawMotivesAgainst = {
  mounted() {
    this.handleEvent("draw_motives_against", ({ spec }) => {
      const runtime = vl.compile(spec).spec;
      const view = new vega.View(vega.parse(runtime))
        .renderer('canvas')
        .initialize('#motives_against')
        .hover()
        .run();

      new Handler().call(view);
    });
  }
};

export { DrawPTnumbers, DrawEUnumbers, DrawSpans,
  DrawGender, DrawHeardAbout, DrawRegion, DrawProbFor,
  DrawMotivesFor, DrawMotivesAgainst };
