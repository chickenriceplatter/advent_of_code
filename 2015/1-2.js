var fs = require('fs');

var data = fs.readFileSync("day1_1_input.txt", "utf8");

data = data.trim();

console.log(typeof(data));

var array = data.split("");

console.log(array.length);

var total = 0;
var counter = 0;

array.some(function(letter) {
  counter = counter + 1
  if(letter == "("){
    total = total + 1;
  } else {
    total = total -1;
    if(total < 0) {
      console.log(counter);
      return counter;
    }
  }
})

// array.forEach(function(letter) {
//   counter = counter + 1
//   if(letter == "("){
//     total = total + 1;
//   } else {
//     total = total -1;
//     if(total < 0) {
//       console.log(counter);
//     }
//   }
// });

// console.log(total);
