import React from "react"
import * as Minesweeper from "./minesweeper.js"
import Board from "./board"

class Game extends React.Component{
    
    constructor(props){
        super(props);

        this.state = {
            board: new Minesweeper.Board(5, 1),
            gameOver: false,
            won: false

        };
        this.updateGame = this.updateGame.bind(this);
    }

    updateGame(){
        if (!this.state.gameOver){
          this.setState({board: this.state.board})
          if (this.state.board.lost()){
              this.setState({ gameOver: true })
          }else if (this.state.board.won()){
              this.setState({ gameOver: true, won: true  })
          }
        }
    }

    resetGame(){
      this.setState({ board: new Minesweeper.Board(5, 1), won: false, gameOver: false })
    }

    printWindow(){
        return(
            <div className="window">
                <h1>{this.printGameStatus()}</h1>
                <button className="button" onClick={() => this.resetGame()}>Play again!</button>
            </div>
        )
    }
    printGameStatus(){
        if (this.state.won){
            return "YOU WON!"
        }else{
            return "YOU LOST!"
        }
    }
    
    render(){
        return(
            <div className="game">
                Minesweeper
                <Board board={this.state.board} updateGame={this.updateGame} />
                {
                    this.state.gameOver ? this.printWindow() : ""
                }
            </div>
            
            
            
        )
    }
}

export default Game;