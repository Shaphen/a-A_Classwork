const View = require("./ttt-view.js");
const Game = require("./game.js");

  $(() => { //only runs when all HTML loads
    let game = new Game;
    let $figure = $(".ttt");
    let board = new View(game, $figure)
    board.setupBoard();
    board.bindEvents();
  });
