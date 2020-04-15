import React from "react";
import Clock from "./clock";
import Tabs from "./tabs";

function Root() {
  const fill1 = "Lorem ipsum, dolor sit amet consectetur adipisicing elit.Vel tenetur nulla delectus possimus deleniti minima unde dolor libero"
  const fill2 = "Aliquid, ea! Sit eos iste in accusantium id distinctio doloribus dignissimos hic."
  return( 
    <div className="container">
      <Clock />
      <Tabs name={[{ title: "T1", content: fill1 }, { title: "T2", content: fill2 }]} />
    </div>
  )
}

export default Root;