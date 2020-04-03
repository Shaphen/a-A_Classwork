/**
 * Initializes the Piece with its color.
 */
const COLORS = ['black', 'white']

function Piece (color) {
  if (COLORS.includes(color)){
    this.color = color;
  }
}

/**
 * Returns the color opposite the current piece.
 */
Piece.prototype.oppColor = function () {
  if (this.color === 'black'){
    return 'white';
  }
  if (this.color === 'white') {
    return 'black';
  }
};

/**
 * Changes the piece's color to the opposite color.
 */
Piece.prototype.flip = function () {
    return this.color = this.oppColor();
};

/**
 * Returns a string representation of the string
 * based on its color.
 */
Piece.prototype.toString = function () {
    if (this.color === 'white') {
        return 'W';
    }
    if (this.color === 'black') {
        return 'B';
    }
};

module.exports = Piece;
