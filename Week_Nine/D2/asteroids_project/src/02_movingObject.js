// move shit here /o/
// methods: 
  // MovingObject.prototype.move, 
  // MovingObject.prototype.draw(ctx), 
  // MovingObject.prototype.isCollidedWith(otherMovingObject)

function MovingObject(opts) { // How did this work?!?!
  this.pos = opts['pos'];
  this.vel = opts['vel'];
  this.radius = opts['radius'];
  this.color = opts['color'];
}



module.exports = MovingObject;