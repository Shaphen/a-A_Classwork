import React from "react";
import ReactDOM from "react-dom";
import Clock from "./clock"; // maybe come back here to add "./"

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Clock />, root);
});