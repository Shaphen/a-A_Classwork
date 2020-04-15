import React from "react";
class Clock extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      time: new Date()
    }
    this.tick = this.tick.bind(this);
  }

  tick() {
    // debugger
    this.setState({time: new Date()});
  }

  componentDidMount() {
    // debugger
    this.handle = setInterval(this.tick, 1000)
  }

  componentWillUnmount() {
    clearInterval(this.handle);
  }

  render() {
    let hours = this.state.time.getHours();
    let minutes = this.state.time.getMinutes();
    let seconds = this.state.time.getSeconds();
    
    return(
      <div className="container">
        <h1 className="clock">Clock</h1>
          <div className="time">
            <h1>Time:</h1>
            <span> {hours}:{minutes}:{seconds} </span>
          </div>
      </div>
      
    )
  }
}

export default Clock;