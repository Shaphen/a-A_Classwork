// collects all the shit: asteroids, bullets, and your ship
// methods: 
  // Game.prototype.step,
  // Game.prototype.move,
  // Game.prototype.checkCollisions,
  // Game.prototype.draw(ctx)
  const Asteroid = require('./03_asteroid.js');

  function Game() {
    this.DIM_X = 25;
    this.DIM_Y = 25;
    this.NUM_ASTEROIDS = 10;
    this.asteroids = this.addAsteroids();
    
  }

  function randomPosition(max) {
    return Math.floor(Math.random() * Math.floor(max))
  }

  Game.prototype.addAsteroids = function() {
    let asteroids = [];
    for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
      asteroids.push(new Asteroid({
        pos: [randomPosition(this.DIM_X), randomPosition(this.DIM_Y)];
      }))
    }
    return asteroids;
  }

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
  this.asteroids.forEach(ast => {
    ast.draw(ctx);
  });
}

  module.exports = Game;

  