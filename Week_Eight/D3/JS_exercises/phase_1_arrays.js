// const doubleTime = function(num, num2) {
//   return num * 2 + num2;
// }

// const doubleTime = (num, num2) => num * 2 + num2;

Array.prototype.uniq = function() {
  let array = [];
  this.forEach(ele => {
      if (!array.includes(ele)){
          array.push(ele);
      }
  });
  return array
}

Array.prototype.twoSum = function() {
  let arr = [];
  // this.forEach(function(num1){
  //   this.forEach(function(num2){
  //     if (num1 + num2 === 0){
  //       let sum = [this.findIndex(num1), this.findIndex(num1)]
  //       arr.push(sum);
  //     }
  //   });
  // });
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      if(this[i] + this[j] === 0 && j > i){
        arr.push([i, j]);
      };
    };
  };
  return arr;
}
// [-1, 0, 1, 2, -2].twoSum(); => [[0, 2], [3, 4]]

Array.prototype.transpose = function(){
    let arr = [];
    for (let i = 0; i < this.length; i++){
      arr.push([]);
    }

    for(let i = 0; i < this.length; i++) {
      for(let j = 0; j < this.length; j++){
        arr[j].push(this[i][j]);
      };
    };
    return arr;
}
//[[1, 2, 3], [1, 2, 3], [1, 2, 3]].transpose()

// def transpose do |arr|
//   final_arr = []
//   arr.each_with_index do |subArr, i|
//     final_arr[i] += [subarr[i]]
//   end
// end
