import React from "react"
import Tile from "./tile"

class Board extends React.Component{
    
    constructor(props){
        super(props);

        this.state = {

        }
    }    
    
    render(){
        return(
            <div className="board">
                {this.props.board.grid.map( (row, idx1) => {
                    return (
                        <div key={idx1} className="row">
                            {
                              row.map((tile,idx2) => {
                                  return <Tile tile={tile} updateGame={this.props.updateGame} key={`${idx1}-${idx2}`} />
                              })
                            }
                        </div>
                    )
                })}
            </div>
        )
    }
}

export default Board;