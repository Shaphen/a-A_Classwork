let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  // debugger;
  // let grid = new Array(8);

  // grid.forEach(row => {
  //   debugger;
  //   row.push(new Array(8));
  // });
  // debugger;
  // return grid;

  let grid = Array.from(Array(8), () => new Array(8));
  grid[3][4] = new Piece('black')
  grid[4][3] = new Piece('black')
  grid[3][3] = new Piece('white')
  grid[4][4] = new Piece('white')
  return grid;
};

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
};

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
]; //adding to our pos will change as a direction

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (!this.isValidPos(pos)) {
    throw new Error('Not valid pos!');
  }

  let x = pos[0];
  let y = pos[1];

  return this.grid[x][y];
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {

};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (this.getPiece(pos)){
    return this.getPiece(pos).color === color;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if(this.getPiece(pos) === undefined){
    return false;
  } else {
    return true;
  }
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  const x = pos[0];
  const y = pos[1];

  if (x < 8 && x >= 0) {
    if (y < 8 && y >= 0) {
      return true;
    }
  }

  return false;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir) {

  if (!board.isValidPos(pos)){
    return null;
  }
  if (!board.isOccupied(pos)){
    return null;
  }
  let x = pos[0] + dir[0];
  let y = pos[1] + dir[1];

  let newPos = [x, y];

  if (!board.grid.isMine(pos, color)){
    let arr = _positionsToFlip(board, newPos, color, dir);
    if (arr === null){
      return null;
    }
    arr.push(board.getPiece(pos));
    return arr;
  } else {
    return [];
  }
  
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  // debugger;
  if (!this.isOccupied(pos)) {
    // debugger;
    for (let i = 0; i < Board.DIRS.length; i++) {
      let positions = _positionsToFlip(this, pos, color, Board.DIRS[i]);
      debugger;
        if (positions !== null) {
          debugger;
          return true;
        };
    };
  };
  return false;
};
  //   Board.DIRS.forEach(dir => {
  //     let positions = _positionsToFlip(this, pos, color, dir);
  //     if (positions !== null) {
  //       // debugger;
  //       return true;
  //     };
  //   });
  // };
  //   return false;

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
};

module.exports = Board;
