// move shit here /o/
// methods: 
  // MovingObject.prototype.move, 
  // MovingObject.prototype.draw(ctx), 
  // MovingObject.prototype.isCollidedWith(otherMovingObject)

// function MovingObject(opts) { // How did this work?!?! Its a string type
//   this.pos = opts['pos'];
//   this.vel = opts['vel'];
//   this.radius = opts['radius'];
//   this.color = opts['color'];
// }

function MovingObject(opts) { 
  this.pos = opts.pos;
  this.vel = opts.vel;
  this.radius = opts.radius;
  this.color = opts.color;
}

MovingObject.prototype.draw = function(ctx){
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill();
}

MovingObject.prototype.move = function() {
  let newPos = [];
  newPos.push(this.pos[0] + this.vel[0]);
  newPos.push(this.pos[1] + this.vel[1]);
  this.pos = newPos;
  this.draw(ctx);
}

module.exports = MovingObject;