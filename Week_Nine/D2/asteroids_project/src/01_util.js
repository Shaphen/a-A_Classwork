// vector math stuff goes here! /o/

const Util = {};
Util.inherits = function(Parent, Child){
  function Surrogate(){};
  Surrogate.prototype = Parent.prototype;
  Child.prototype = new Surrogate();
  Child.prototype.constructor = Child;
}
Util.randomVec = function(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
}
Util.scale = function(vec, m) {
    return [vec[0] * m, vec[1] * m];
}

module.exports = Util;