import React from "react";
import "styled-components/macro";

export const ComponentA = () => (
  <div
    css={`
      padding: 5px;
      border: 1px dotted #999;
    `}
  >
    component A
  </div>
);

export const ComponentB = () => (
  <div
    css={`
      padding: 5px;
      border: 1px dotted #999;
    `}
  >
    component B
  </div>
);

export const ComponentC = () => (
  <div
    css={`
      padding: 5px;
      border: 1px dotted #999;
    `}
  >
    component C
  </div>
);

export const ComponentD = () => (
  <div
    css={`
      padding: 5px;
      border: 2px dotted #999;
      overflow: auto;
      height: 100%;
      position: relative;
    `}
  >
    <div
      css={`
        position: absolute;
      `}
    >
      {"component D ".repeat(100)}
    </div>
  </div>
);
