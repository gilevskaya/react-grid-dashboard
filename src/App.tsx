/// <reference types="styled-components/cssprop" />
import React from "react";
import "styled-components/macro";

import { Dashboard } from "./components/Dashboard";

function App() {
  return (
    <div
      css={`
        height: 100vh;
        padding: 10px;
        border: 2px dashed #aaa;
        display: flex;
        flex-direction: column;
        background: #bbb;
      `}
    >
      <div
        css={`
          margin: 10px;
          padding: 10px;
          height: 70px;
          border: 2px dashed #aaa;
        `}
      ></div>
      <div
        css={`
          flex: 1;
          display: flex;
        `}
      >
        <div
          css={`
            flex: 1;
            margin: 10px;
            padding: 10px;
            border: 2px dashed #aaa;
          `}
        ></div>
        <div
          css={`
            flex: 10;
            margin: 10px;
            border: 2px dashed #aaa;
            background: #ccc;
          `}
        >
          <Dashboard />
        </div>
      </div>
    </div>
  );
}

export default App;
