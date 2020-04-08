// Spacerock? It inherits from MovingObject

function Asteroid(obj) {
    // Util.inherits(MovingObject, Asteroid);
    this.COLOR = '#8B008B';
    this.RADIUS = 15;
    this.pos = obj.pos;
    // let asteroid = new MovingObject({
    //     pos: this.pos, 
    //     vel: Util.randomVec(10), 
    //     radius: this.RADIUS, 
    //     color: this.COLOR
    // });

    // asteroid.draw(ctx);
}

// module.exports = Asteroid;