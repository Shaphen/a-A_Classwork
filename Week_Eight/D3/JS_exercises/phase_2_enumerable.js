// Array.prototype.myEach = function(callback) {
//   for (i = 0; i < this.length; i++){
//     console.log(callback(this[i]));
//   };
// };

// function callback(num) {
//   num * 2;
// };

//____________________________________________________________________

Array.prototype.myEach = function(cb) { //cb = callback
  for (i = 0; i < this.length; i++){
    cb(this[i]);
  };
  return null // can also do return undefined
};

// [1,2,3].myEach(function(el){
//   console.log(el);
// }); => 1 2 3

//____________________________________________________________________

Array.prototype.myMap = function(cb) {
  let result  = []
  this.forEach(function(ele){
    result.push(cb(ele));
  });
  return result
}

// [1,2,3],myMap(function(el){
//   return el * 2;
// }); => [2,4,6]

//____________________________________________________________________

//reduce is like inject for ruby
Array.prototype.myReduce = function(cb, acc){
  // const copy = this.slice() => create blank copy of array if can't mutate
  if (acc === undefined) {
    acc = copy.shift();
  };
  copy.myEach(el => {
    acc = cb(acc, el);
  });
  return acc
};

// [1,2,3].myReduce((acc, el) => {
//   return acc + el;
// }); => 6

//____________________________________________________________________
