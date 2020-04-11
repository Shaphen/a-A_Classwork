// elementList = parentNode.querySelectorAll(selectors);
let DOMNodeCollection = require('./dom_node_collection.js');

window.$l = (arg) => {
  if (typeof arg === "string") { //".banana"
    // debugger
    let eleList = document.querySelectorAll(arg);
    let eleArr = Array.from(eleList);
    return new DOMNodeCollection(eleArr);
  } else if (arg instanceof HTMLElement){
    return new DOMNodeCollection([arg]);
  }
}
