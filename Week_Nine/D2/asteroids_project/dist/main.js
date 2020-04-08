/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/01_util.js":
/*!************************!*\
  !*** ./src/01_util.js ***!
  \************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("// vector math stuff goes here! /o/\n\nconst Util = {};\nUtil.inherits = function(Parent, Child){\n  function Surrogate(){};\n  Surrogate.prototype = Parent.prototype;\n  Child.prototype = new Surrogate();\n  Child.prototype.constructor = Child;\n}\nUtil.randomVec = function(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n}\nUtil.scale = function(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n}\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/01_util.js?");

/***/ }),

/***/ "./src/02_movingObject.js":
/*!********************************!*\
  !*** ./src/02_movingObject.js ***!
  \********************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("// move shit here /o/\n// methods: \n  // MovingObject.prototype.move, \n  // MovingObject.prototype.draw(ctx), \n  // MovingObject.prototype.isCollidedWith(otherMovingObject)\n\n// function MovingObject(opts) { // How did this work?!?! Its a string type\n//   this.pos = opts['pos'];\n//   this.vel = opts['vel'];\n//   this.radius = opts['radius'];\n//   this.color = opts['color'];\n// }\n\nfunction MovingObject(opts) { \n  this.pos = opts.pos;\n  this.vel = opts.vel;\n  this.radius = opts.radius;\n  this.color = opts.color;\n}\n\nMovingObject.prototype.draw = function(ctx){\n  ctx.fillStyle = this.color;\n  ctx.beginPath();\n\n  ctx.arc(\n    this.pos[0],\n    this.pos[1],\n    this.radius,\n    0,\n    2 * Math.PI,\n    false\n  );\n\n  ctx.fill();\n}\n\nMovingObject.prototype.move = function() {\n  let newPos = [];\n  newPos.push(this.pos[0] + this.vel[0]);\n  newPos.push(this.pos[1] + this.vel[1]);\n  this.pos = newPos;\n  this.draw(ctx);\n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/02_movingObject.js?");

/***/ }),

/***/ "./src/03_asteroid.js":
/*!****************************!*\
  !*** ./src/03_asteroid.js ***!
  \****************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("// Spacerock? It inherits from MovingObject\n\nfunction Asteroid(obj) {\n    // Util.inherits(MovingObject, Asteroid);\n    this.COLOR = '#8B008B';\n    this.RADIUS = 15;\n    this.pos = obj.pos;\n    // let asteroid = new MovingObject({\n    //     pos: this.pos, \n    //     vel: Util.randomVec(10), \n    //     radius: this.RADIUS, \n    //     color: this.COLOR\n    // });\n\n    // asteroid.draw(ctx);\n}\n\n// module.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/03_asteroid.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// console.log(\"Webpack is working!\");\nconst MovingObject = __webpack_require__(/*! ./02_movingObject.js */ \"./src/02_movingObject.js\");\nwindow.MovingObject = MovingObject;\nconst Asteroid = __webpack_require__(/*! ./03_asteroid.js */ \"./src/03_asteroid.js\");\nwindow.Asteroid = Asteroid;\nconst Util = __webpack_require__(/*! ./01_util.js */ \"./src/01_util.js\");\nwindow.Util = Util;\n\nwindow.addEventListener('DOMContentLoaded',function (event) {\n    let canvas = document.getElementById('game-canvas');\n    let ctx = canvas.getContext('2d');\n    window.canvas = canvas;\n    window.ctx = ctx;\n});\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });