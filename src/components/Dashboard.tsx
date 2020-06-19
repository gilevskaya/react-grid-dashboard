import React from "react";
import "styled-components/macro";

import { ComponentA, ComponentB, ComponentC, ComponentD } from "./Tiles";

const LAYOUT_CONFIG = Object.freeze({
  a: { x: 1, y: 1, w: 5, h: 5, component: ComponentA },
  b: { x: 1, y: 6, w: 5, h: 7, component: ComponentB },
  c: { x: 6, y: 1, w: 19, h: 6, component: ComponentC },
  d: { x: 6, y: 7, w: 8, h: 6, component: ComponentD },
});

export const Dashboard = () => {
  return (
    <div
      css={`
        height: 100%;
        width: 100%;

        display: grid;
        gap: 0.4rem;
        grid-template-rows: repeat(12, minmax(0, 1fr));
        grid-template-columns: repeat(24, minmax(0, 1fr));
      `}
    >
      {Object.entries(LAYOUT_CONFIG).map(
        ([name, { x, y, w, h, component: Tag }]) => (
          <div
            ref={(el) => {
              if (!el) return;
              console.log(name, el.getBoundingClientRect());
            }}
            key={name}
            css={`
              grid-column-start: ${x};
              grid-row-start: ${y};
              grid-column-end: span ${w};
              grid-row-end: span ${h};

              background: #ddd;
              border: 1px solid #999;
              overflow: hidden;
            `}
          >
            <Tag />
          </div>
        )
      )}
    </div>
  );
};
