import React from "react";
import Clock from "./clock";
import Tabs from "./tabs";

function Root() {
  return( 
    <div className="container">
      <Clock />
      <Tabs name={[{title: "T1", content: "C1"}, {title: "T2", content: "C2"}]} />
    </div>
  )
}

export default Root;