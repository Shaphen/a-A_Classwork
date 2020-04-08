// console.log("Webpack is working!");
const MovingObject = require('./02_movingObject.js');
window.MovingObject = MovingObject;
const Asteroid = require('./03_asteroid.js');
window.Asteroid = Asteroid;
const Util = require('./01_util.js');
window.Util = Util;
const Game = require('./06_game.js');
window.Game = Game;

window.addEventListener('DOMContentLoaded',function (event) {
    let canvas = document.getElementById('game-canvas');
    let ctx = canvas.getContext('2d');
    window.canvas = canvas;
    window.ctx = ctx;
});
