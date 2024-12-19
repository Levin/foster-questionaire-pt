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

export { DrawPTnumbers, DrawEUnumbers };
