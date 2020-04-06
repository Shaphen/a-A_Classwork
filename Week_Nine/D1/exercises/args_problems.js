// function sum(){
//   let eles = Array.from(arguments);
//   acc = 0;
//   for (let i = 0; i<eles.length; i++){
//     acc = acc + eles[i];
//   }
//   return acc
// }

function sum(...arg){
  // let eles = Array.from(arguments);
  acc = 0;
  for (let i = 0; i<arg.length; i++){
    acc = acc + arg[i];
  }
  return acc
}




class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

Object.prototype.myBind = function(newthis){
  //this
  // this = newthis;
  // method("hello", "person")
  // newthis.prototype.method = this;
  
  let method = this; //says
  let args = Array.from(arguments).slice(1); //capture args other than first

  return function(){
    // this = newthis;
    let innerArgs = Array.from(arguments);
    let combined = args.concat(innerArgs);
    return method.call(newthis, ...combined); //method.apply(newthis, combined);
  }
  // debugger
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// markov.says.myBind(pavlov); 
markov.says.myBind(pavlov)("meow", "a tree"); //call time args


function sum(arg) {
  // let eles = Array.from(arguments);
  let acc = 0;
  for (let i = 0; i < arg.length; i++) {
    acc = acc + arg[i], 10;
  }
  return acc
}

function curriedSum(numArgs){
  let numbers = [];

  return _curriedSum = function(num){
    numbers.push(num);
    if (numbers.length === numArgs){
      return sum(numbers);
    } else {
      return _curriedSum;
    }
  }
  
}

const sumThis = curriedSum(4);
sumThis(5)(30)(20)(1); // => 56


function sum(arg) {
  // let eles = Array.from(arguments);
  let acc = 0;
  for (let i = 0; i < arg.length; i++) {
    acc = acc + arg[i], 10;
  }
  return acc
}
Function.prototype.curry = function(numArgs){

  let results = [];

  return _curried = (arg) => {
    results.push(arg);
    if (results.length === numArgs){
      return this(results);
    } else {
      return _curried;
    }
  }

}
const sumThis = sum.curry(4);
sumThis(5)(30)(20)(1); // => 56



Function.prototype.curry = function (numArgs) {

  let results = [];

  return _curried = (args) => {
    results.push(args);
    if (results.length === numArgs) {
      return this(results);
    } else {
      return _curried;
    }
  }

}
const sumThis = sum.curry(4);
sumThis([5, 30, 20, 1]) //apply version
