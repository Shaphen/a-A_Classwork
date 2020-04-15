import React from "react"

class Tile extends React.Component {

  constructor(props) {
    super(props);

    this.state = {

    }
  }

  handleClick() {
    // console.log(event)
    if (event.altKey === true){
        this.props.tile.flagged = !this.props.tile.flagged;
    } else {
      this.props.tile.explore();
    }
    this.props.updateGame()
  }

  printTile(){
    if (this.props.tile.explored){
      if (this.props.tile.bombed) {
        return "💣";
      } else {
        if (this.props.tile.adjacentBombCount() === 0){
          return "";
        } else {
          return this.props.tile.adjacentBombCount();
        }
      }
    }
    if (this.props.tile.flagged){
      return "🚩";
    }
  }
  
  setClassName(){
      if (this.props.tile.bombed && this.props.tile.explored) return "bombed tile";

    if (this.props.tile.explored){
        return "explored tile"
    }else{
        return "tile"
    }

  }

  render() {
    // let explored = ;

    return (
        <div className={this.setClassName()} onClick={(event) => {this.handleClick(event)}}>
            {this.printTile()}
        </div>
    )
  }
}

export default Tile;