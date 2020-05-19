// Spacerock? It inherits from MovingObject
const Util = require('./01_util.js');
const MovingObject = require('./02_movingObject.js');
const DEFAULT = {
    RADIUS: 7,
    COLOR: 'purple',
};

function Asteroid(obj) {
    obj.radius = DEFAULT.RADIUS;
    obj.vel = Util.randomVec(8);
    obj.color = DEFAULT.COLOR;
    MovingObject.call(this, obj)
}

Util.inherits(MovingObject, Asteroid);

module.exports = Asteroid;
