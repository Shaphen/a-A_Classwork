// elementList = parentNode.querySelectorAll(selectors);

window.$l = (arg) => {
  if (typeof arg === "string") {
    // debugger
    let  eleList = document.querySelectorAll(arg);
    let eleArr = Array.from(eleList);
    return eleArr;
  }
}
